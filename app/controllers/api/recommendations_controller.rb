# frozen_string_literal: true

module Api
  class RecommendationsController < BaseController
    before_action :require_current_user
    before_action :require_current_iteration

    def index
      @recommendations = if params[:iteration_id]
                           current_iteration.recommendations.order(priority: :desc).distinct.to_a
                         else
                           Recommendation.order(priority: :desc).distinct.to_a
                         end

      return unless @recommendations.count < 7

      @recommendations += Recommendation.general.to_a
      @recommendations.uniq!
      @recommendations.sort! { |a, b| b.priority <=> a.priority } # sorty by highest priorty first
    end

    def show
      @recommendation = Recommendation.find(params[:id])
    end
  end
end
