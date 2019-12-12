# frozen_string_literal: true

module Api
  class BaseController < ActionController::API
    protected
    include Pundit
    def current_user
      @current_user ||= User.find_by(slug: (request.headers['X-USER-SLUG'] || params[:user_slug]))
    end

    # the current iteration is always the last iteration
    # When a user creates a new iterations the old ones can not be changed again
    def current_iteration
      return @current_iteration ||= current_user.iterations.find(params[:iteration_id]) || current_user.iterations.last if params[:iteration_id]

      @current_iteration ||= current_user.iterations.last
    end

    def require_current_user
      render json: { error: 'User not found' }, status: :unauthorized if current_user.blank?
    end

    def require_current_iteration
      render json: { error: 'Iteration not found' }, status: :unauthorized if current_user.blank? || current_iteration.blank?
    end
  end
end
