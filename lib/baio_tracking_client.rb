require 'baio_tracking_client/version'
require 'baio_tracking_client/errors'
require 'baio_tracking_client/client'
require 'baio_tracking_client/configuration'

module BaioTrackingClient
  extend Configuration

  class << self
    attr_accessor(:http_client)

    def client
      configure
      @http_client ||= BaioTrackingClient::Client.new
    end

    def in_parallel
      client.in_parallel do
        yield
      end
    end

    def post_event(params:)
      client.post_event(params: params)
    end

    def get_event(event:, params:)
      client.get_event(event: event, params: params)
    end
  end
end
