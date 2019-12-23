# frozen_string_literal: true

module Api
  class RecommendationsController < BaseController
    before_action :require_current_user, except: [:all, :show]
    before_action :require_current_iteration, except: [:all, :show]

    def index
      @recommendations = current_iteration.recommendations.order(priority: :desc).distinct.to_a

      return unless @recommendations.count < 7

      @recommendations += Recommendation.general.to_a
      @recommendations.uniq!
      @recommendations.sort! { |a, b| b.priority <=> a.priority } # sorty by highest priorty first
    end

    def all
      @recommendations = Recommendation.order(priority: :desc).distinct.to_a
      render '/api/recommendations/index'
    end

    def show
      @recommendation = Recommendation.find(params[:id])
    end
  end
end
