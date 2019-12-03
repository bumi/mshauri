# frozen_string_literal: true

module Api
  class QuestionsController < BaseController
    def show
      @question = Question.find(params[:id])
      @answrrs= Answer.where
      render json: @question
    end
  end
end
