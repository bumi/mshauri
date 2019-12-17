# frozen_string_literal: true

module Api
  class UsersController < BaseController
    before_action :require_current_user, only: [:me]

    def me
      render json: current_user
    end

    private

    def user_params
      params.require(:user).permit(:email, :name)
    end
  end
end
