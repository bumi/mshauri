# frozen_string_literal: true

module Api
  class BaseController < ActionController::API
    protected

    def current_user
      @current_user ||= User.find_by(slug: (request.headers['X-USER-SLUG'] || params[:user_slug]))
    end

    # the current iteration is always the last iteration
    # When a user creates a new iterations the old ones can not be changed again
    def current_iteration
      @current_iteration ||= current_user.iterations.last
    end

    def require_current_user
      render json: { error: 'User not found' }, status: :unauthorized if current_user.blank?
    end

    def require_iteration
      render json: { error: 'Iteration not found' }, status: :unauthorized if current_user.blank? || iteration.blank?
    end
  end
end
