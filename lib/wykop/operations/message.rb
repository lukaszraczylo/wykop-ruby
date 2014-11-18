module Wykop
  module Operations
    class Messages
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def messages_list
        q_url = @request.replace_url({ :banana => 'pm', :potato => 'conversationslist' } )
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def messages_read( p = {} )
        q_url = @request.replace_url({ :banana => 'pm', :potato => 'conversation', :param1 => p[:param1] } )
        p.delete(:param1)
        q_body = p
        return @request.execute(q_url, q_body)
      end

      def messages_delete( p = {} )
        q_url = @request.replace_url({ :banana => 'pm', :potato => 'deleteconversation', :param1 => p[:param1] } )
        p.delete(:param1)
        q_body = p
        return @request.execute(q_url, q_body)
      end

      def message_send( p = {} )
        q_url = @request.replace_url({ :banana => 'pm', :potato => 'sendmessage', :param1 => p[:param1] } )
        p.delete(:param1)
        q_body = p
        return @request.execute(q_url, q_body)
      end
    end
  end
end