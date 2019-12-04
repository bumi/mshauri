# frozen_string_literal: true

module Api
  class IterationAnswersController < Api::BaseController
    before_action :require_current_user
    before_action :require_current_iteration

    def create
      answer = Answer.find(request_params[:answer_id])
      @iteration_answer = current_iteration.iteration_answers.build(answer: answer, question: answer.question, value: params[:value])
      if @iteration_answer.save
        render json: answer.next_question_id
      else
        render json: @iteration_answer.errors, status: :unprocessable_entity
      end
    end

    private

    def request_params
      params.permit(:answer_id, :iteration_id)
    end
  end
end
