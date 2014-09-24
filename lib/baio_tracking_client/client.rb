require 'faraday'
require 'typhoeus'
require 'typhoeus/adapters/faraday'
require 'faraday_middleware'

module BaioTrackingClient
  class Client
    attr_reader(:base_url, :port, :username, :password)

    def initialize(config = {})
      @base_url = "http://#{ config.fetch(:base_url, get_config_value(:base_url)) }"
      @port = config.fetch(:port, get_config_value(:port))
      @username = config.fetch(:username, get_config_value(:username))
      @password = config.fetch(:password,  get_config_value(:password))
    end


    def post_event(params:)
      post(path: '/api/v1/events', params: params)
    end

    def connection
      @connection ||= Faraday.new(url: "#{base_url}:#{port.to_s}") do |conn|
        conn.request :basic_auth, username, password
        conn.request :json
        conn.adapter :typhoeus
      end
    end

    class << self
      def clear
        BaioTrackingClient.http_client = nil
      end
    end

    private

    def post(path:, params: {})
      connection.post(path, params)
    rescue Faraday::TimeoutError
      'failed to conect tracking server'
    end

    def get_config_value(key)
      BaioTrackingClient.send(key) || raise(BaioTrackingClient::NoConfigurationError, "Not set #{key}")
    end
  end
end