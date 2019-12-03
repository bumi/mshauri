# frozen_string_literal: true

class IterationAnswer < ApplicationRecord
  belongs_to :answer
  belongs_to :iteration
  belongs_to :question

  def next_question
    self.answer.next_question
  end

  def as_json(args = {})
    super(args.merge(
      methods: %i[next_question]
    ))
  end
end
