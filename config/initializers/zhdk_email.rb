Rails.application.config.action_mailer.raise_delivery_errors = true
Rails.application.config.action_mailer.perform_deliveries = true
Rails.application.config.action_mailer.default_url_options = { host: ENV['APP_HOST'] }

Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
  address: 'mail2.zhdk.ch',
  port: '587',
  user_name: ENV['SMTP_USERNAME'],
  password: ENV['SMTP_PASSWORD'],
  authentication: :login,
  enable_starttls_auto: true
}
