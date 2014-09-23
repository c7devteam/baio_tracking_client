require 'simplecov'
require 'rspec'
require 'baio_tracking_client'
require 'pry-byebug'

Dir["./spec/support/**/*.rb"].sort.each { |f| require f}
SimpleCov.start
