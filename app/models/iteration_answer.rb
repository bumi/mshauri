# frozen_string_literal: true

class IterationAnswer < ApplicationRecord
  validates :question_id, uniqueness: { scope: :iteration_id }, unless: proc { |a| a.question.multiple? }
  belongs_to :answer
  belongs_to :iteration
  belongs_to :question

  delegate :next_question, to: :answer

  def as_json(args = {})
    super(args.merge(
      methods: %i[next_question]
    ))
  end
end
