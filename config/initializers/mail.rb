# frozen_string_literal: true

ENV['MAIL_HOST'] ||= 'localhost:3000'
ActionMailer::Base.default_url_options = {
  host: ENV['MAIL_HOST'],
}
ActionMailer::Base.default_options = {
  from: ENV['MAIL_SENDER'] || "no-reply@#{ENV['MAIL_HOST']}",
}

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
