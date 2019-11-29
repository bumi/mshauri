# frozen_string_literal: true

class Iteration < ApplicationRecord
  belongs_to :user
  has_many :answers, through: 'iterations_answers'
end
