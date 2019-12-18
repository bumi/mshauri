# frozen_string_literal: true

class User < ApplicationRecord
  has_many :iterations, dependent: :destroy
  before_validation :insert_slug
  after_save :send_welcome_email, if: :email_changed?

  # Validations for the model
  validates :slug, presence: true, uniqueness: true
  validates :email, uniqueness: { allow_blank: true }

  def send_welcome_email
    UserMailer.with(user: user).welcome_email.deliver_now if email.present? && email_changed?
  end

  def insert_slug
    self.slug ||= SecureRandom.hex
  end
end
