module Wykop
  module Operations
    class Favorites
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def favorite_index( p = {} )
        q_url = replace_url({ :banana => 'favorites', :potato => 'index', :param1 => p[:param1] } )
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def favorite_comments( p = {} )
        q_url = replace_url({ :banana => 'favorites', :potato => 'comments' } )
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def favorite_entries( p = {} )
        q_url = replace_url({ :banana => 'favorites', :potato => 'entries' } )
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def favorite_lists( p = {} )
        q_url = replace_url({ :banana => 'favorites', :potato => 'lists' } )
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