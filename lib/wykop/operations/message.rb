module Wykop
  module Operations
    class Messages
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def messages_list
        q_url = replace_url({ :banana => 'pm', :potato => 'conversationslist' } )
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def messages_read( p = {} )
        q_url = replace_url({ :banana => 'pm', :potato => 'conversation', :param1 => p[:param1] } )
        p.delete(:param1)
        q_body = p
        return @request.execute(q_url, q_body)
      end

      def messages_delete( p = {} )
        q_url = replace_url({ :banana => 'pm', :potato => 'deleteconversation', :param1 => p[:param1] } )
        p.delete(:param1)
        q_body = p
        return @request.execute(q_url, q_body)
      end

      def message_send( p = {} )
        q_url = replace_url({ :banana => 'pm', :potato => 'sendmessage', :param1 => p[:param1] } )
        p.delete(:param1)
        q_body = p
        return @request.execute(q_url, q_body)
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
    end
  end
end