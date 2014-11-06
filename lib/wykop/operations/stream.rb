module Wykop
  module Operations
    class Stream
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def stream_show( p = {} )
        if ! p.has_key?(:page); p[:page] = 0; end
        q_url = replace_url({ :banana => 'stream', :potato => 'index', :page => p[:page]} )
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def stream_hot( p = {} )
        if ! p.has_key?(:page); p[:page] = 0; end
        q_url = replace_url({ :banana => 'stream', :potato => 'hot', :page => p[:page]} )
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def replace_url(p = {} )
        standard_url = "#{@client.configuration.api_host}/banana/potato/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}/page,#{p[:page]}"
        return standard_url.gsub(/banana/, p[:banana]).gsub(/potato/, p[:potato])
      end
    end
  end
end