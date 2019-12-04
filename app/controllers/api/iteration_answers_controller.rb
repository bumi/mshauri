# frozen_string_literal: true

module Api
  class IterationAnswersController < Api::BaseController
    before_action :require_current_user
    before_action :require_current_iteration

    def create
      @iteration_answers = params[:answers].map do |answer_id|
        answer = Answer.find(answer_id)
        current_iteration.iteration_answers.build(answer: answer, question: answer.question, value: params[:value])
      end
      if @iteration_answers.all?(&:valid?) && @iteration_answers.each(&:save!)
        render json: @iteration_answers.first.answer.next_question_id
      else
        render json: @iteration_answers.map(&:errors), status: :unprocessable_entity
      end
    end

    private

    def request_params
      params.permit(:answers, :iteration_id)
    end
  end
end
