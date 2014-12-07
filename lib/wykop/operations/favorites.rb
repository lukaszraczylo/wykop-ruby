module Wykop
  module Operations
    class Favorites
      # Documentation: http://www.wykop.pl/dla-programistow/dokumentacja/#info6_15
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def favorite_index( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'favorites', :potato => 'index', :param1 => p[:param1] } ), Hash.new)
      end

      def favorite_comments( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'favorites', :potato => 'comments' } ), Hash.new)
      end

      def favorite_entries( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'favorites', :potato => 'entries' } ), Hash.new)
      end

      def favorite_lists( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'favorites', :potato => 'lists' } ), Hash.new)
      end
    end
  end
end