class User < ApplicationRecord
  has_many :iterations


  # Validations for the model
  validates :name, presence: true
  validates :email, :slug, presence: true, uniqueness: true

end
