# frozen_string_literal: true

module Api
  class RecommendationsController < BaseController
    before_action :require_current_user
    skip_after_action :verify_authorized, only: %i[show]

    def index
      @recommendations = policy_scope(Recommendation).order(priority: :desc).distinct.to_a
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
