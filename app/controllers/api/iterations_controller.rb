# frozen_string_literal: true

module Api
  class IterationsController < BaseController
    def create
      user = User.find_by(slug: post_params[:slug])
      if user
        user.iteration.create
      else
        render json: 'Invalid user', status: :not_found
      end
    end

    private

    def post_params
      params.permit(:slug)
    end
  end
end
