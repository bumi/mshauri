# frozen_string_literal: true

module Api
  class QuestionsController < BaseController
    before_action :require_current_user, only: [:index]

    def index
      @user = current_user
      authorize @user
      questions = Question.all
      render json: questions
    end

    def show
      @question = Question.find(params[:id])
    end
  end
end
