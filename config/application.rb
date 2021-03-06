require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module UserRegistration
  class Application < Rails::Application
    # NOTE: set assets.enabled for backwards compatibility for premailer gem
    # it is a deprecated Rails 3 config key, which is checked by premailer to
    # see if the asset pipeline can be used to find the css file
    config.assets.enabled = true
    config.assets.paths << Rails.root.join('app/assets/batman/html')
    config.assets.register_mime_type('text/html', '.html')

    config.honeypot_field_name = "extra_info"
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :nl
    config.assets.precompile += ['email.css']
  end
end
