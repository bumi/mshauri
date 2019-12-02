# frozen_string_literal: true

class Question < ApplicationRecord
  after_initialize :init

  validates :title, presence: true
  validates :description, presence: false

  def init
    self.entry ||= false
  end
end
