require 'wykop/configuration'
require 'wykop/operations/user'
require 'wykop/error'
require 'awesome_print'

module Wykop
	class Client
			REQUEST_CLASSES = [ Wykop::Operations::User ]
			attr_reader :configuration

			def initialize(options = nil)
					@configuration = nil
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