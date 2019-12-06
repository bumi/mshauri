# frozen_string_literal: true

class Iteration < ApplicationRecord
  belongs_to :user
  has_many :iteration_answers, dependent: :destroy
  has_many :answers, through: :iteration_answers
  has_many :questions, through: :iteration_answers
  has_many :recommendations, through: :answers

  def answer_question(answer, value = nil)
    return false if iteration_answers.find_by(question: answer.question)

    iteration_answers.create(answer: answer, question: answer.question, value: value)
  end

  def complete?
    return false if answers.last.blank? || answers.last.next_question_id

    true
  end

  # For now we always start with the first question
  # This can later be easily changed by changing this method
  def starting_question_id
    Question.first.id
  end

  def completion_rate
    return 100 if complete?

    (questions.distinct.count.to_f / Question.count * 100).to_i
  end

  def as_json(args = {})
    super(args.merge(
      methods: %i[starting_question_id completion_rate complete?]
    ))
  end
end
