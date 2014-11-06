module Wykop
  module Operations
    class Rank
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def rank_show(how = nil)
        if how.nil?
          how = 'rank'
        end
        q_url = replace_url('rank', 'index', how)
        ap q_url
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def replace_url(banana = nil, potato = nil, how = nil)
        standard_url = "#{@client.configuration.api_host}/banana/potato/order/order_content/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}"
        return standard_url.gsub(/banana/, banana).gsub(/potato/, potato).gsub(/order_content/, how.to_s)
      end
    end
  end
end