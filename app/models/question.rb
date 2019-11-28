class Question < ApplicationRecord


  validates :title, presence: true
  validates :description, presence: false
end
