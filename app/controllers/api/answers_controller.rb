# frozen_string_literal: true

class Api::AnswersController < Api::BaseController
  def store
    iteration = Iteration.find(request_params[:iteration_id])
    answer = Answer.find(request_params[:answer_id])
    if iteration && answer
      iteration.answers << answer
      render json: true
    end
    render json: false, status: :not_found
  end

  private

  def request_params
    params.permit(:answer_id, :iteration_id)
  end
end
