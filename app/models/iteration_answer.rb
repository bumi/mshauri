# frozen_string_literal: true

class IterationAnswer < ApplicationRecord
  validates :question_id, uniqueness: { scope: :iteration_id }, unless: proc { |a| a.question.multiple? }
  belongs_to :answer
  belongs_to :iteration
  belongs_to :question

  after_create :notify_completion, if: proc { |a| a.iteration.completed? }

  delegate :next_question, to: :answer

  def notify_completion
    return unless iteration.completed?

    iteration.notify_completion
  end

  def as_json(args = {})
    super(args.merge(
      methods: %i[next_question]
    ))
  end
end
