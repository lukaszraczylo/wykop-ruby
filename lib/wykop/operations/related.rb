module Wykop
  module Operations
    class Related
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def related_vote_up( p = {} )
        q_url = @request.replace_url({ :banana => 'related', :potato => 'plus', :param1 => p[:param1], :param2 => p[:param2] } )
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def related_vote_down( p = {} )
        q_url = @request.replace_url({ :banana => 'related', :potato => 'minus', :param1 => p[:param1], :param2 => p[:param2] } )
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def related_add( p = {} )
        q_url = @request.replace_url({ :banana => 'related', :potato => 'add', :param1 => p[:param1] } )
        p.delete(:param1)
        q_body = p
        return @request.execute(q_url, q_body)
      end
    end
  end
end