# frozen_string_literal: true

module Api
  class QuestionsController < BaseController
    def show
      @question = Question.find(params[:id])
      render json: @question
    end

    def next
      if current_iteration.answers.blank?
        return render json: Question.find(current_iteration.starting_question_id)
      end
      render json: current_iteration.answers.last.next_question
    end
  end
end
