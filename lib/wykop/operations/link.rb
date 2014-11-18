module Wykop
  module Operations
    class Link
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def link_index( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'links', :potato => 'index', :param1 => p[:param1] }), Hash.new)
      end

      def link_dig( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'links', :potato => 'dig', :param1 => p[:param1] }), Hash.new)
      end

      def link_cancel( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'links', :potato => 'cancel', :param1 => p[:param1] }), Hash.new)
      end

      def link_bury( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'links', :potato => 'cancel', :param1 => p[:param1], :param2 => p[:param2] }), Hash.new)
      end

      def link_comments( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'links', :potato => 'comments', :param1 => p[:param1] }), Hash.new)
      end

      def link_reports( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'links', :potato => 'reports', :param1 => p[:param1] }), Hash.new)
      end

      def link_digs( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'links', :potato => 'digs', :param1 => p[:param1] }), Hash.new)
      end

      def link_related( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'links', :potato => 'related', :param1 => p[:param1] }), Hash.new)
      end

      def link_buryreasons( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'links', :potato => 'buryreasons' }), Hash.new)
      end

      def link_observe( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'links', :potato => 'observe', :param1 => p[:param1] }), Hash.new)
      end

      def link_favorite( p = {} )
        return @request.execute(@request.replace_url({ :banana => 'links', :potato => 'favorite', :param1 => p[:param1] }), Hash.new)
      end
    end
  end
end