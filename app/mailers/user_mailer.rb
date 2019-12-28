# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def login
    @user = params[:user]
    mail(to: @user.email, subject: 'Rwanda Tech Guide Login')
  end

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to the Rwanda Tech Guide')
  end

  def recommendations
    @iteration = params[:iteration]
    @user = @iteration.user
    @recommendations = @iteration.recommendations
    mail(to: @user.email, subject: 'Your Rwanda Tech Guide Recommendations')
  end
end
