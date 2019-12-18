# frozen_string_literal: true

module Api
  class UsersController < BaseController
    before_action :require_current_user, only: %i[index me show]
    skip_after_action :verify_authorized, only: %i[me]

    def index
      users = policy_scope(User)
      render json: users
    end

    def show
      @user = User.find(params[:id])
      authorize @user
    end

    def me
      render json: current_user
    end

    private

    def user_params
      params.require(:user).permit(:email, :name)
    end
  end
end
