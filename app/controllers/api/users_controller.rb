# frozen_string_literal: true

module Api
  class UsersController < BaseController
    before_action :require_current_user, only: [:me]

    def me
      render json: current_user
    end

    def create
      user = User.new(name: request_params[:name], email: request_params[:email])
      if user.save
        redirect_to controller: '/home', action: :index, user_slug: user.slug
      else

        render json: user.errors, status: :unprocessable_entity
      end
    end

    private

    def request_params
      params.permit(:email, :name)
    end
  end
end
