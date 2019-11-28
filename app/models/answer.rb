# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :next_question, class_name: 'Question', foreign_key: :question_id # rubocop:disable Rails/InverseOf
  after_initialize :init

  def init
    self.score ||= 0.0
    self.freetext ||= false
  end
end
