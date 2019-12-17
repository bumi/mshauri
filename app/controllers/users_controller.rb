# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save && @user.iterations.build.save # TODO: refactor iteration creation and redirect to iteration
      redirect_to iteration_question_url(
        user_slug:    @user.slug,
        iteration_id: @user.iterations.last.id,
        question_id:  @user.iterations.last.starting_question_id
      )
    else
      render '/home/welcome'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
