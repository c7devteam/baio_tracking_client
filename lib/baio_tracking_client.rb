require 'baio_tracking_client/version'
require 'baio_tracking_client/errors'
require 'baio_tracking_client/client'
require 'baio_tracking_client/configuration'

module BaioTrackingClient
  extend Configuration

  class << self
    def client
      configure
      BaioTrackingClient::Client.new
    end
  end
end
