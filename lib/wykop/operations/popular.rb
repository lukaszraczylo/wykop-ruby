module Wykop
  module Operations
    class Popular
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def popular_show(what = nil)
        if what.nil?
          what = 'promoted'
        else
          what = 'upcoming'
        end
        q_url = replace_url('popular', what)
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def replace_url(banana = nil, potato = nil)
        standard_url = "#{@client.configuration.api_host}/banana/potato/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}"
        return standard_url.gsub(/banana/, banana).gsub(/potato/, potato)
      end
    end
  end
end