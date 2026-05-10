Devise.setup do |config|
  config.mailer_sender = "no-reply@example.com"
  require "devise/orm/active_record"
  config.omniauth :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end
