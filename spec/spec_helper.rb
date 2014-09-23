require 'simplecov'
require 'rspec'
require 'baio_tracking_client'
require 'pry-byebug'
require 'webmock/rspec'
require 'vcr'

Dir["./spec/support/**/*.rb"].sort.each { |f| require f}
SimpleCov.start
VCR.configure do |c|
  c.hook_into :webmock
  c.ignore_hosts 'coveralls.io'
  c.cassette_library_dir     = 'spec/cassettes'
  c.default_cassette_options = { :record => :new_episodes }
end