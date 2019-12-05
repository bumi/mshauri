# frozen_string_literal: true

module Api
    class RecommendationsController < BaseController
        def show
            @recommendation=Recommendation.find(params[:id])
            render json:@recommendation
        end

    end
end