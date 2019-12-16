# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'notifications@mshauri.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
