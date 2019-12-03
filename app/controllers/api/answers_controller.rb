# frozen_string_literal: true

module Api
  class AnswersController < Api::BaseController
    before_action :require_current_user
    before_action :require_current_iteration

    def create
      answer = Answer.find(request_params[:answer_id])
      if current_iteration.answer_question(answer)
        question = Question.where(id: answer.next_question_id).first
        render json: question.id
      else
        render json: false, status: :unprocessable_entity
      end
    end

    private

    def request_params
      params.permit(:answer_id, :iteration_id)
    end
  end
end
