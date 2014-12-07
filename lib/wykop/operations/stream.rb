module Wykop
  module Operations
    class Stream
      # Documentation: http://www.wykop.pl/dla-programistow/dokumentacja/#info6_16
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def stream_show( p = {} )
        if ! p.has_key?(:page); p[:page] = 0; end
        return @request.execute(replace_url({ :banana => 'stream', :potato => 'index', :page => p[:page]} ), Hash.new)
      end

      def stream_hot( p = {} )
        if ! p.has_key?(:page); p[:page] = 0; end
        return @request.execute(replace_url({ :banana => 'stream', :potato => 'hot', :page => p[:page]} ), Hash.new)
      end

      def replace_url(p = {} )
        standard_url = "#{@client.configuration.api_host}/banana/potato/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}/page,#{p[:page]}"
        return standard_url.gsub(/banana/, p[:banana]).gsub(/potato/, p[:potato])
      end
    end
  end
end