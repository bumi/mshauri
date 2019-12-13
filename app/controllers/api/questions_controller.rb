# frozen_string_literal: true

module Api
  class QuestionsController < BaseController
    authorize @user
    def index
      questions = Question.all
      render json: questions
    end

    def show
      @question = Question.find(params[:id])
    end
  end
end
