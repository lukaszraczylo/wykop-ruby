module Wykop
  module Operations
    class Related
      # Documentation: http://www.wykop.pl/dla-programistow/dokumentacja/#info6_10
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def related_vote_up( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'related', :potato => 'plus', :param1 => p[:param1], :param2 => p[:param2] } ), Hash.new)
      end

      def related_vote_down( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'related', :potato => 'minus', :param1 => p[:param1], :param2 => p[:param2] } ), Hash.new)
      end

      def related_add( p = {} )
        p.delete(:param1)
        return @request.execute(@request.replace_url({ :banana => 'related', :potato => 'add', :param1 => p[:param1] } ), p)
      end
    end
  end
end