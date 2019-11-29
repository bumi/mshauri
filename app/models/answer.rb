# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :next_question, class_name: 'Question'
  has_and_belongs_to_many :iterations, join_table: 'iterations_answers'
  after_initialize :init

  def init
    self.score ||= 0.0
    self.freetext ||= false
  end
end
