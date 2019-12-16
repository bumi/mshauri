# frozen_string_literal: true

class Answer < ApplicationRecord
  after_initialize :init

  belongs_to :question
  belongs_to :next_question, class_name: 'Question', optional: true
  belongs_to :recommendation, optional: true
  has_many :iteration_answers, dependent: :destroy
  has_many :iterations, through: :iteration_answers

  validates :value, presence: true

  def init
    self.score ||= 0.0
    self.input ||= false
  end
end
