# frozen_string_literal: true

module Api
  class IterationAnswersController < Api::BaseController
    before_action :require_current_user
    before_action :require_current_iteration

    def create
      params[:answers].each do |answer_id|
        answer = Answer.find(answer_id)
        @iteration_answer = current_iteration.iteration_answers.build(answer: answer, question: answer.question, value: params[:value])
        @iteration_answer.save
      end
      if @iteration_answer
        render json: @iteration_answer.answer.next_question_id
      else
        render json: @iteration_answer.errors, status: :unprocessable_entity
      end
    end

    private

    def request_params
      params.permit(:answers, :iteration_id)
    end
  end
end
