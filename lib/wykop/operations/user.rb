require 'awesome_print'
require 'digest/md5'
require 'httparty'

module Wykop
	module Operations
		class User
      def initialize(client)
        @client = client
      end

      def login
      	# Opening new connection to wykop API. It returns configuration hash and all the client information
      	@client.user_info = login_request
      	if @client.user_info.nil?
      		return false
      	end
      	return true
      end

      def info(what = nil)
      	request = Wykop::Operations::Request.new(@client)
      	if what == nil
      		return @client.user_info
      	else
      		return @client.user_info[what]
      	end
      end

      private

      def login_request(params = nil)
      	# Building request URL
      	request = Wykop::Operations::Request.new(@client)
      	q_body = { 'login' => @client.configuration.app_username, 'accountkey' => @client.configuration.app_generated_key }
      	q_url = "#{@client.configuration.api_host}/user/login/appkey/#{@client.configuration.app_user_key}"
      	request.execute(q_url, q_body)
      end
		end
	end
end