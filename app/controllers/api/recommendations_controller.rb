# frozen_string_literal: true

module Api
    class RecommendationsController < BaseController
        before_action :require_current_user
        before_action :require_current_iteration

        def index
            render json: current_iteration.recommendations.all
        end

        def show
            @recommendation=Recommendation.find(params[:id])
            render json:@recommendation
        end

    end
end