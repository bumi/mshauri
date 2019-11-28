class User < ApplicationRecord
  has_many :iterations
  before_validation :insert_slug

  # Validations for the model
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true


  def insert_slug
    self.slug ||= SecureRandom.hex
  end

end
