# frozen_string_literal: true

module Api
  class IterationAnswersController < Api::BaseController
    before_action :require_current_user
    before_action :require_current_iteration

    def create
      @iteration_answers = params[:answers].map do |a|
        answer = Answer.find(a[:answer_id])
        current_iteration.iteration_answers.build(answer: answer, question: answer.question, value: a[:value])
      end
      if @iteration_answers.all?(&:valid?) && @iteration_answers.each(&:save!)
        render json: @iteration_answers.first.answer.next_question_id
      else
        render json: @iteration_answers.map(&:errors), status: :unprocessable_entity
      end
    end

    def update
      @iteration_answer = IterationAnswer.find(params[:id])
      @iteration_answer.recommendation_resolved_at = DateTime.now
      @iteration_answer.save!
      render json: 'successful'
    end

    private

    def request_params
      params.permit(:answers, :iteration_id)
    end
  end
end
