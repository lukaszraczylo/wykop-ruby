module Wykop
  module Operations
    class Favorites
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def favorite_index( p = {} )
        q_url = @request.replace_url({ :banana => 'favorites', :potato => 'index', :param1 => p[:param1] } )
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def favorite_comments( p = {} )
        q_url = @request.replace_url({ :banana => 'favorites', :potato => 'comments' } )
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def favorite_entries( p = {} )
        q_url = @request.replace_url({ :banana => 'favorites', :potato => 'entries' } )
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def favorite_lists( p = {} )
        q_url = @request.replace_url({ :banana => 'favorites', :potato => 'lists' } )
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end
    end
  end
end