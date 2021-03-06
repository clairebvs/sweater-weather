require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'support/factory_bot'
require 'shoulda/matchers'
require 'simplecov'
SimpleCov.start 'rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  # config.filter_sensitive_data('<key>') { ENV['geocode_key'] }
  # config.filter_sensitive_data('<key>') { ENV['dark_sky_key'] }
  # config.filter_sensitive_data('<key>') { ENV['flickr_key'] }
  # config.filter_sensitive_data('<key>') { ENV['flickr_secret'] }
end
