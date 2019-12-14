# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'notifications@mshauri.com'

  def welcome_email
    @user = params[:user]
    @url  =  url_for(controller: '/home', action: :index, user_slug: @user.slug, host: ENV['MAIL_HOST'])
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
