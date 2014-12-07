module Wykop
  module Operations
    class Rank
      # Documentation: http://www.wykop.pl/dla-programistow/dokumentacja/#info6_13
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def rank_show( p = {} )
        if ! p.has_key?(:order); p[:order] = 'rank'; end
        q_url = replace_url({ :banana => 'rank', :potato => 'index', :order => p[:order] })
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def replace_url( p = {} )
        standard_url = "#{@client.configuration.api_host}/banana/potato/order/order_content/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}"
        return standard_url.gsub(/banana/, p[:banana]).gsub(/potato/, p[:potato]).gsub(/order_content/, p[:order])
      end
    end
  end
end