# frozen_string_literal: true

class HomeController < ApplicationController
  # entry point for the vue.js app
  # rendered with a given user slug /[USER SLUG]
  def index
    @user = User.find_by!(slug: params[:user_slug])

    # calling the spa(single page application) layout which invokes the
    # vue and vue router to handle the requests
    render layout: 'spa'
  end

  # page rendered as root - when no user slug is given
  def welcome
    @user = User.new
  end
end
