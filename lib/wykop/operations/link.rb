module Wykop
  module Operations
    class Link
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def link_index( p = {} )
        q_url = replace_url({ :banana => 'links', :potato => 'index', :param1 => p[:param1] })
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def link_dig( p = {} )
        q_url = replace_url({ :banana => 'links', :potato => 'dig', :param1 => p[:param1] })
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def link_cancel( p = {} )
        q_url = replace_url({ :banana => 'links', :potato => 'cancel', :param1 => p[:param1] })
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def link_bury( p = {} )
        q_url = replace_url({ :banana => 'links', :potato => 'cancel', :param1 => p[:param1], :param2 => p[:param2] })
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def link_comments( p = {} )
        q_url = replace_url({ :banana => 'links', :potato => 'comments', :param1 => p[:param1] })
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def link_reports( p = {} )
        q_url = replace_url({ :banana => 'links', :potato => 'reports', :param1 => p[:param1] })
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def link_digs( p = {} )
        q_url = replace_url({ :banana => 'links', :potato => 'digs', :param1 => p[:param1] })
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def link_related( p = {} )
        q_url = replace_url({ :banana => 'links', :potato => 'related', :param1 => p[:param1] })
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def link_buryreasons( p = {} )
        q_url = replace_url({ :banana => 'links', :potato => 'buryreasons' })
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def link_observe( p = {} )
        q_url = replace_url({ :banana => 'links', :potato => 'observe', :param1 => p[:param1] })
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def link_favorite( p = {} )
        q_url = replace_url({ :banana => 'links', :potato => 'favorite', :param1 => p[:param1] })
        q_body = Hash.new
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