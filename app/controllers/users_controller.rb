# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    login or register
  end

  private

  def login
    return false if user_params[:email].blank?

    @user = User.find_by(email: user_params[:email])
    return false unless @user

    UserMailer.with(user: @user).login.deliver_now
    flash[:notice] = 'Welcome back. Please use the link in the email to access your recommendations'
    redirect_to root_url
  end

  def register
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

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
