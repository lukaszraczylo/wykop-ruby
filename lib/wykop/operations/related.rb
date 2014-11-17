module Wykop
  module Operations
    class Related
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def related_vote_up( p = {} )
        q_url = replace_url({ :banana => 'related', :potato => 'plus', :param1 => p[:param1], :param2 => p[:param2] } )
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def related_vote_down( p = {} )
        q_url = replace_url({ :banana => 'related', :potato => 'minus', :param1 => p[:param1], :param2 => p[:param2] } )
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def related_add( p = {} )
        q_url = replace_url({ :banana => 'related', :potato => 'add', :param1 => p[:param1] } )
        p.delete(:param1)
        q_body = p
        return @request.execute(q_url, q_body)
      end

      def replace_url( p = {} )
        standard_url = "#{@client.configuration.api_host}/banana/potato/param1/param2/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}"
        standard_url = standard_url.gsub(/param1/, p[:param1].to_s)
        if ! p[:param2].nil?
          standard_url = standard_url.gsub(/param2/, p[:param2].to_s)
        else
          standard_url = standard_url.gsub(/\/param2/, '')
        end
        return standard_url.gsub(/banana/, p[:banana]).gsub(/potato/, p[:potato])
      end
    end
  end
end