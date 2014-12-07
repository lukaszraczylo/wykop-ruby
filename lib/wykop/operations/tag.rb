module Wykop
  module Operations
    class Tag
      # Documentation: http://www.wykop.pl/dla-programistow/dokumentacja/#info6_17
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def tag_show( p = {} )
        if ! p.has_key?(:page); p[:page] = 0; end
        if ! p.has_key?(:type); p[:type] = 'index'; end
        return @request.execute(@request.replace_url({ :banana => 'tag', :potato => p[:type], :param1 => p[:param1], :page => p[:page] } ), Hash.new)
      end

      def tag_observe( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'tag', :potato => 'observe', :param1 => p[:param1]}), Hash.new)
      end

      def tag_unobserve( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'tag', :potato => 'unobserve', :param1 => p[:param1]}), Hash.new)
      end

      def tag_block( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'tag', :potato => 'block', :param1 => p[:param1]}), Hash.new)
      end

      def tag_unblock( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'tag', :potato => 'unblock', :param1 => p[:param1]}), Hash.new)
      end
    end
  end
end