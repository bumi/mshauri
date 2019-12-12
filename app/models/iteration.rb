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

  def completed?
    answers.any? && answers.last.next_question_id.blank?
  end

  # For now we always start with the first question
  # This can later be easily changed by changing this method
  def starting_question_id
    return answers.last.next_question_id if answers.any?

    Question.first.id
  end

  def completion_rate
    return 100 if completed?

    (questions.distinct.count.to_f / Question.count * 100).to_i
  end

  def as_json(args = {})
    super(args.merge(
      methods: %i[starting_question_id completion_rate completed?]
    ))
  end
end
