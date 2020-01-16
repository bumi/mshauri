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
    iteration_answers.any? && iteration_answers.last.answer.next_question_id.blank?
  end

  # This method will return the first question in case the
  # the iteration has no answer yet and then return the last answer's next question in
  # case the iteration has answers
  def starting_question_id
    return iteration_answers.last.answer.next_question_id if iteration_answers.any?

    question = Question.find_by(identifier: '1') || Question.first || Question.new
    question.id
  end

  def completion_rate
    return 100 if completed?

    return (questions.distinct.count.to_f / Question.count * 100).to_i if questions.any?

    0
  end

  def as_json(args = {})
    super(args.merge(
      methods: %i[starting_question_id completion_rate completed?]
    ))
  end

  def notify_completion
    return if !completed? || user.email.blank?

    UserMailer.with(iteration: self).recommendations.deliver_now
  end
end
