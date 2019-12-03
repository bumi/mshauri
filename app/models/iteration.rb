# frozen_string_literal: true

class Iteration < ApplicationRecord
  belongs_to :user
  has_many :iteration_answers, dependent: :destroy
  has_many :answers, through: :iteration_answers

  def answer_question(answer, value = nil)
    return false if iteration_answers.find_by(question: answer.question)

    iteration_answers.create(answer: answer, question: answer.question, value: value)
  end

  # For now we always start with the first question
  # This can later be easily changed by changing this method
  def starting_question_id
    Question.first.id
  end

  def completion_rate
    # just added a default before the implementing the function
    12.0
  end

  def as_json(args = {})
    super(args.merge(
      methods: %i[starting_question_id completion_rate]
    ))
  end
end
