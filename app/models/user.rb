class User < ApplicationRecord
  has_many :iterations


  # Validations for the model
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

end
