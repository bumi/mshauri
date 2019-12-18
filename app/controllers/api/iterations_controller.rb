# frozen_string_literal: true

module Api
  class IterationsController < BaseController
    before_action :require_current_user

    # get all current user's iterations
    def index
      iterations = policy_scope(Iteration)
      render json: iterations
    end

    def show
      @iteration = Iteration.find(params[:id])
      authorize @iteration
    end

    def create
      @iteration = current_user.iterations.build
      authorize @iteration
      if @iteration.save
        render json: @iteration
      else
        render json: @iteration.errors, status: :unprocessable_entity
      end
    end
  end
end
