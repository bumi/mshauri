# frozen_string_literal: true

module Api
  class UsersController < BaseController
    before_action :require_current_user, only: [:me]

    def me
      render json: current_user
    end

    def create
      user = User.new(user_params)
      if user.save
        redirect_to controller: '/home', action: :index, user_slug: user.slug
      else

        render json: user.errors, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.permit(:email, :name)
    end
  end
end
