require 'digest/md5'
require 'httparty'

module Wykop
  module Operations
    class Request
      def initialize(client)
        @client = client
      end

      def replace_url( p = {} )
        standard_url = "#{@client.configuration.api_host}/banana/potato/param1/param2/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}"
        if ! p[:param1].nil?
          standard_url = standard_url.gsub(/param1/, p[:param1].to_s)
        else
          standard_url = standard_url.gsub(/\/param1/, '')
        end
        if ! p[:param2].nil?
          standard_url = standard_url.gsub(/param2/, p[:param2].to_s)
        else
          standard_url = standard_url.gsub(/\/param2/, '')
        end
        return standard_url.gsub(/banana/, p[:banana]).gsub(/potato/, p[:potato])
      end

      def execute(req_url = nil, req_data = nil)
        sorted_request_body = Hash[req_data.sort_by { |key, value| key }]
        q_body_parsed = []
        sorted_request_body.each do |sval|
          q_body_parsed.push(sval[1])
        end
        request_signature = Digest::MD5.hexdigest(@client.configuration.app_user_secret + req_url + q_body_parsed.join(','))
        obj = HTTParty.post(req_url.to_s, :body => req_data, :headers => {"apisign" => request_signature}).to_json
        JSON.parse(obj)
      end
    end
  end
end