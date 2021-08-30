# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  domain: 'railscasts.com',
  user_name: 'adansarfraz5',
  password: 'JPjXEQphFpTJj7q',
  authentication: 'plain',
  enable_starttls_auto: true
}
