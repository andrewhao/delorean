# Acceptance builds on production's configuration.
require Rails.root.join('config/environments/production')

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb and config/production.rb.

  config.action_mailer.default_url_options = { host: 'delorean-acceptance.herokuapp.com' }
end
