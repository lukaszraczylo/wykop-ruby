module Wykop
  class Configuration
    AUTH_KEYS = [:app_user_key, :app_username, :app_generated_key, :app_user_secret, :api_host]
    attr_accessor *AUTH_KEYS

    # Creates configuration
    # @param [Hash] - hash containing config params and their values
    # @return [Configuration] - a new configuration with the vaules from the config_hash set
    def initialize(config_hash = nil)
      if config_hash.is_a?(Hash)
        config_hash.each do |config_name, config_value|
          self.send("#{config_name}=", config_value)
        end
      end
    end

    # Returns a hash of api keys and their values
    def auth_keys
      AUTH_KEYS.inject({}) do |keys_hash, key|
        keys_hash[key] = send(key)
        keys_hash
      end
    end

    def valid?
      AUTH_KEYS.none?{ |key| send(key).nil? || send(key).empty? }
    end
  end
end