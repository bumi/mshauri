# frozen_string_literal: true

module Api
  class IterationsController < BaseController
    before_action :require_current_user

    def create
      @iteration = current_user.iterations.build
      if @iteration.save
        render json: @iteration
      else
        render json: @iteration.errors, status: :unprocessable_entity
      end
    end
  end
end
