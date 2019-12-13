# frozen_string_literal: true

class User < ApplicationRecord
  has_many :iterations, dependent: :destroy
  before_validation :insert_slug

  after_create { |user| UserMailer.with(user: user).welcome_email.deliver_now if user.email.present? }

  # Validations for the model
  validates :slug, presence: true, uniqueness: true
  validates :email, uniqueness: { allow_blank: true }

  def insert_slug
    self.slug ||= SecureRandom.hex
  end
end
