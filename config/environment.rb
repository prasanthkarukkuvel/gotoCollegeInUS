# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Gotocollegeinus::Application.initialize!
# configure action_mailer
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gotocollegeinus.com",
  :user_name            => "prashanth702@gmail.com",
  :password             => "int_98section",
  :authentication       => "plain",
  :enable_starttls_auto => true,
  :openssl_verify_mode  => 'none'
}
