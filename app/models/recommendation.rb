# frozen_string_literal: true

class Recommendation < ApplicationRecord
  belongs_to :answer
  validates :title, :description, presence: true
end
