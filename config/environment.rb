# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  domain: 'railscasts.com',
  user_name: Rails.application.credentials.google[:access_key_id],
  password: Rails.application.credentials.google[:secret_access_key],
  authentication: 'plain',
  enable_starttls_auto: true
}
