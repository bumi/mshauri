# frozen_string_literal: true

module Api
  class QuestionsController < BaseController
    def index
      question = Question.where(entry: true).first!
      render json: question
    end

    def show
      @question = Question.find(params[:id])
      render json: @question
    end
  end
end
