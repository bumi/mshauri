# frozen_string_literal: true

class AnswersController < Api::BaseController
  def create
    iteration = Iteration.find(request_params[:iteration_id])
    answer = Answer.find(request_params[:answer_id])
    if iteration && answer
      iteration.answers << answer
      render json: true
    else
      render json: false, status: :not_found
    end
  end

  private

  def request_params
    params.permit(:answer_id, :iteration_id)
  end
end
