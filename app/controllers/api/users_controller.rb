# frozen_string_literal: true

module Api
  class UsersController < BaseController
    before_action :require_current_user, only: %i[index me show]

    def index
      authorize @current_user
      users = User.all
      render json: users
    end

    def show
      authorize @current_user
      @user = User.find(params[:id])
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
