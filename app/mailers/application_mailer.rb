# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'contact@tech-guide.rw'
  layout 'mailer'
end
