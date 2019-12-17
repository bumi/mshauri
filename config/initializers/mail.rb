# frozen_string_literal: true

if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
    port:           ENV['SMTP_PORT'],
    address:        ENV['SMTP_ADDRESS'],
    user_name:      ENV['SMTP_LOGIN'],
    password:       ENV['SMTP_PASSWORD'],
    domain:         ENV['SMTP_DOMAIN'],
    authentication: :plain,
  }
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.raise_delivery_errors = false
end
