# frozen_string_literal: true

module Api
  class RecommendationsController < BaseController
    before_action :require_current_user
    before_action :require_current_iteration

    def index
      render json: current_iteration.recommendations.order(priority: :desc).distinct.all
    end

    def show
      @recommendation = Recommendation.find(params[:id])
    end
  end
end
