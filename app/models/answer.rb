# frozen_string_literal: true

class Answer < ApplicationRecord
  after_initialize :init

  belongs_to :question
  belongs_to :next_question, class_name: 'Question', optional: true
  has_many :iteration_answers, dependent: :destroy
  has_many :iterations, through: :iteration_answers
  has_many :recommendations, dependent: :destroy
  has_many :users, through: :iterations

  validates :value, presence: true

  def init
    self.score ||= 0.0
    self.input ||= false
  end

  def user_count
    users.count
  end
end
