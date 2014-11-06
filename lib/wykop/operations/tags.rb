module Wykop
  module Operations
    class Tags
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def tags_show
        q_url = replace_url({ :banana => 'tags', :potato => 'index' })
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def replace_url( p = {} )
        standard_url = "#{@client.configuration.api_host}/banana/potato/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}"
        return standard_url.gsub(/banana/, p[:banana]).gsub(/potato/, p[:potato])
      end
    end
  end
end