# frozen_string_literal: true

module Api
  class QuestionsController < BaseController
    def show
      @question = Question.find(params[:id])
    end
  end
end
