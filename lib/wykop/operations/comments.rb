module Wykop
  module Operations
    class Comments
      # Documentation: http://www.wykop.pl/dla-programistow/dokumentacja/#info6_1
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def comments_add( p = {} )
        param1 = p[:param1]
        param2 = p[:param2]
        p.delete(:param1)
        p.delete(:param2)
        # Deleting all the crufty params, dropping everything into request body
        return @request.execute(replace_url({ :banana => 'comments', :potato => 'add', :param1 => param1, :param2 => param2 ), p)
      end

      def comments_plus( p = {} )
        return @request.execute(replace_url({ :banana => 'comments', :potato => 'plus', :param1 => p[:param1], :param2 => p[:param2] ), Hash.new)
      end

      def comments_minus( p = {} )
        return @request.execute(replace_url({ :banana => 'comments', :potato => 'minus', :param1 => p[:param1], :param2 => p[:param2] ), Hash.new)
      end

      def comments_edit( p = {} )
        param1 = p[:param1]
        param2 = p[:param2]
        p.delete(:param1)
        p.delete(:param2)
        # Deleting all the crufty params, dropping everything into request body
        return @request.execute(replace_url({ :banana => 'comments', :potato => 'edit', :param1 => param1, :param2 => param2 ), p)
      end

      def comments_delete( p = {} )
        return @request.execute(replace_url({ :banana => 'comments', :potato => 'delete', :param1 => p[:param1], :param2 => p[:param2] ), Hash.new)
      end
    end
  end
end