# frozen_string_literal: true

class Recommendation < ApplicationRecord
  has_many :answers, dependent: :nullify

  validates :title, :description, :identifier, presence: true
  validates :identifier, uniqueness: true
end
