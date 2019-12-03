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
    return Question.first.id if iteration_answers.blank?

    answers.last.next_question_id
  end

  def as_json(args = {})
    super(args.merge(
      methods: [:starting_question_id]
    ))
  end
end
