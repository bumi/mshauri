# frozen_string_literal: true

module Api
  class UsersController < Api::BaseController
    def show
      user = User.find_by(slug: params[:id])
      if user
        render json: user
      else
        render json: 'Invalid user', status: :not_found
      end
    end
  end
end
