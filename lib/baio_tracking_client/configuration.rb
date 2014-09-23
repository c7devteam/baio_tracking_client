module BaioTrackingClient::Configuration
  ATTRIBUTES = [:url, :port, :username, :password].freeze

  attr_accessor(*ATTRIBUTES)

  def configure
    if block_given?
      yield self
    else
      valid_attrinutes_present
    end
  end

  def valid_attrinutes_present
    ATTRIBUTES.map do |c|
      if self.send(c).nil? || self.send(c).empty?
        raise BaioTrackingClient::NoConfigurationError, "Not set #{c}"
      end
    end
  end

  def clear_config
    ATTRIBUTES.map do |c|
      self.send("#{c}=", nil)
    end
  end
end