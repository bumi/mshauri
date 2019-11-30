module Api
  class QuestionsController < BaseController
    def show
      @question = Question.find(params[:id])
      render json: @question
    end
  end
end
