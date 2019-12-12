# frozen_string_literal: true

module Api
  class UsersController < BaseController
    before_action :require_current_user, only: [:me]

    def me
      render json: current_user
    end

    def create
      user = User.create!
      redirect_to controller: '/home', action: :index, user_slug: user.slug
    end
  end
end
