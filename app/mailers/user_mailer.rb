# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'contact@tech-guide.rw'

  def login
    @user = params[:user]
    mail(to: @user.email, subject: 'Rwanda Tech Guide Login')
  end

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to the Rwanda Tech Guide')
  end
end
