# frozen_string_literal: true

class Question < ApplicationRecord

  has_many :answers, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: false
end
