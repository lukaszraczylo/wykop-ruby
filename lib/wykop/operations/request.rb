require 'digest/md5'
require 'httparty'

module Wykop
  module Operations
    class Request
      def initialize(client)
        @client = client
      end

      def execute(req_url = nil, req_data = nil)
        sorted_request_body = Hash[req_data.sort_by { |key, value| key }]
        q_body_parsed = []
        sorted_request_body.each do |sval|
          q_body_parsed.push(sval[1])
        end
        request_signature = Digest::MD5.hexdigest(@client.configuration.app_user_secret + req_url + q_body_parsed.join(','))
        obj = HTTParty.post(req_url.to_s, :body => req_data, :headers => {"apisign" => request_signature}).to_json
        result = JSON.parse(obj)
      end
    end
  end
end