module Wykop
  module Operations
    class Messages
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def messages_list
        return @request.execute(@request.replace_url({ :banana => 'pm', :potato => 'conversationslist' } ), Hash.new)
      end

      def messages_read( p = {} )
        p.delete(:param1)
        return @request.execute(@request.replace_url({ :banana => 'pm', :potato => 'conversation', :param1 => p[:param1] } ), p)
      end

      def messages_delete( p = {} )
        p.delete(:param1)
        return @request.execute(@request.replace_url({ :banana => 'pm', :potato => 'deleteconversation', :param1 => p[:param1] } ), p)
      end

      def message_send( p = {} )
        p.delete(:param1)
        return @request.execute(@request.replace_url({ :banana => 'pm', :potato => 'sendmessage', :param1 => p[:param1] } ), p)
      end
    end
  end
end