# frozen_string_literal: true

module Api
  class UsersController < BaseController
    before_action :require_current_user

    def me
      render json: current_user
    end
  end
end
