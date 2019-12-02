# frozen_string_literal: true

module Api
  class IterationsController < BaseController
    before_action :set_user, only: %i[index create]

    def index
      if @user
        render json: @user.iterations
      else
        render json: 'Not user provided', status: :not_found
      end
    end

    def create
      if @user
        @user.iteration.create
      else
        render json: 'Invalid user', status: :not_found
      end
    end

    private

    def set_user
      @user = User.find_by(slug: post_params[:slug])
    end

    def post_params
      params.permit(:slug)
    end
  end
end
