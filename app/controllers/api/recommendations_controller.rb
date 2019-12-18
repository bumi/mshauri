# frozen_string_literal: true

module Api
  class RecommendationsController < BaseController
    before_action :require_current_user
    skip_after_action :verify_authorized, only: %i[show]

    def index
      recommendations = policy_scope(Recommendation)

      if params[:iteration_id]
        recommendations = recommendations.joins(:iterations)
                                         .where(iterations: { id: params[:iteration_id] })
                                         .order(priority: :desc)
                                         .distinct
      end

      render json: recommendations
    end

    def show
      @recommendation = Recommendation.find(params[:id])
    end
  end
end
