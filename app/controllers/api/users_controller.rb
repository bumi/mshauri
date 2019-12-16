# frozen_string_literal: true

module Api
  class UsersController < BaseController

    before_action :require_current_user, only: [:me]

    authorize @user
    def index
      users = User.all
      render json: users
    end

    def me
      render json: current_user
    end

    def create
      user = User.new(user_params)
      if user.save && user.iterations.build.save # TODO: refactor iteration creation and redirect to iteration
        redirect_to iteration_question_url(
          user_slug:    user.slug,
          iteration_id: user.iterations.last.id,
          question_id:  user.iterations.last.starting_question_id
        )
      else

        render json: user.errors, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :name)
    end
  end
end
