# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'info@dinnerdash.com'
  layout 'mailer'
end
