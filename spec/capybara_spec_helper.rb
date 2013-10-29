ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/poltergeist'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, timeout: 5)
end

RSpec.configure do |config|
  config.use_transactional_fixtures = false
end

if ENV.fetch('IN_BROWSER', false)
  Capybara.default_driver    = :selenium
  Capybara.javascript_driver = :selenium
else
  Capybara.default_driver    = :poltergeist
  Capybara.javascript_driver = :poltergeist
end

if ENV.fetch('WITH_HOST', false)
  Capybara.app_host = ENV['WITH_HOST']
  Capybara.run_server = false
end
