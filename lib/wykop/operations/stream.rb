module Wykop
  module Operations
    class Stream
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def stream_show(page = nil)
        if page.nil?
          page = 0
        end
        q_url = replace_url('stream', 'index', page)
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def stream_hot(page = nil)
        if page.nil?
          page = 0
        end
        q_url = replace_url('stream', 'hot', page)
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def replace_url(banana = nil, potato = nil, page = 0)
        standard_url = "#{@client.configuration.api_host}/banana/potato/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}/page,#{page}"
        return standard_url.gsub(/banana/, banana).gsub(/potato/, potato)
      end
    end
  end
end