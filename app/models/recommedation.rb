class Recommedation < ApplicationRecord
  belongs_to :answer

  validates :title, :description, presence: true

end
