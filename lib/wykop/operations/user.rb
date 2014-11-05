require 'awesome_print'

module Wykop
	module Operations
		class User
      def initialize(client)
        @client = client
      end

      def login
      	# Opening new connection to wykop API
      	ap @client
      end

      private

      def login_request(params = nil)
      	# Opening new connection
      end
		end
	end
end