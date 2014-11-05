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
      	# Opening new connection to wykop API
      	ap login_request
      end

      private

      def login_request(params = nil)
      	# Building request URL
      	q_url = "#{@client.configuration.api_host}/user/login/appkey/#{@client.configuration.app_user_key}"
      	q_body = { 'login' => @client.configuration.app_username, 'accountkey' => @client.configuration.app_generated_key }
      	q_body_parsed = q_body['accountkey'] + "," + q_body['login']
      	request_signature = Digest::MD5.hexdigest(@client.configuration.app_user_secret + q_url + q_body_parsed)
      	# Signing up app request. I mean.. Seriously? What's wrong with them?
      	result = HTTParty.post(q_url.to_s, :body => q_body, :headers => { "apisign" => request_signature } )
      	result
      end
		end
	end
end