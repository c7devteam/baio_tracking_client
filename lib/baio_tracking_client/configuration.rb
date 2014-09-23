module BaioTrackingClient::Configuration
  ATTRIBUTES = [:base_url, :port, :username, :password]

  attr_accessor(*ATTRIBUTES)

  def configure
    if block_given?
      yield self
    end
    valid_attributes_present
  end

  def valid_attributes_present
    ATTRIBUTES.map do |c|
      if self.send(c).nil? || self.send(c).empty?
        raise BaioTrackingClient::NoConfigurationError, "Not set #{c}"
      end
    end
  end

  def clear_configs
    BaioTrackingClient::Client.clear
    ATTRIBUTES.map do |c|
      self.send("#{c}=", nil)
    end
  end
end