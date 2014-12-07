require 'wykop/configuration'
require 'wykop/operations/user'
require 'wykop/error'
require 'awesome_print'
require 'httparty'
require 'json'

require 'wykop/operations/request'

require 'wykop/operations/add'
require 'wykop/operations/top'
require 'wykop/operations/tag'
require 'wykop/operations/tags'
require 'wykop/operations/rank'
require 'wykop/operations/link'
require 'wykop/operations/links'
require 'wykop/operations/search'
require 'wykop/operations/stream'
require 'wykop/operations/popular'
require 'wykop/operations/related'
require 'wykop/operations/message'
require 'wykop/operations/favorites'
require 'wykop/operations/observatory'

module Wykop
  class Client
    REQUEST_CLASSES = [Wykop::Operations::User, Wykop::Operations::Request, Wykop::Operations::Top,
                       Wykop::Operations::Popular, Wykop::Operations::Links, Wykop::Operations::Rank,
                       Wykop::Operations::Observatory, Wykop::Operations::Tags, Wykop::Operations::Stream,
                       Wykop::Operations::Search, Wykop::Operations::Add, Wykop::Operations::Related,
                       Wykop::Operations::Favorites, Wykop::Operations::Messages, Wykop::Operations::Link,
                       Wykop::Operations::Tag]
    attr_reader :configuration
    attr_accessor :user_info
    attr_accessor :request_data

    def initialize(options = nil)
      @configuration = nil
      @user_info = nil
      @request_data = nil
      define_request_methods

      unless options.nil?
        @configuration = Configuration.new(options)
        check_api_keys
      end
    end

    def check_api_keys
      if configuration.nil? || !configuration.valid?
        @configuration = nil
        raise Error::NoApiKeys
      else
        @configuration.freeze
      end
    end

    def define_request_methods
      REQUEST_CLASSES.each do |request_class|
        operations_instance = request_class.new(self)
        create_methods_from_instance(operations_instance)
      end
    end

    def create_methods_from_instance(instance)
      instance.public_methods(false).each do |method_name|
        add_method(instance, method_name)
      end
    end

    def add_method(instance, method_name)
      define_singleton_method(method_name) do |*args|
        instance.public_send(method_name, *args)
      end
    end
  end
end