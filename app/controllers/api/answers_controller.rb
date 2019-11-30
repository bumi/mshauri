# frozen_string_literal: true

module Api
  class AnswersController < Api::BaseController
    def create
      iteration = Iteration.find(request_params[:iteration_id])
      answer = Answer.find(request_params[:answer_id])
      return render json: true if iteration && answer && iteration.answer_question(answer)

      render json: false, status: :unprocessable_entity
    end

    private

    def request_params
      params.permit(:answer_id, :iteration_id)
    end
  end
end
