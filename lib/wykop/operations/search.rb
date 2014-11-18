module Wykop
  module Operations
    class Search
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def search_index( p = {} )
        if ! p.has_key?(:page); p[:page] = 0; end
        return @request.execute(replace_url( { :banana => 'search', :potato => 'index', :page => p[:page] } ), { 'q' => p[:q] })
      end

      def search_entries( p = {} )
        if ! p.has_key?(:page); p[:page] = 0; end
        return @request.execute(replace_url( { :banana => 'search', :potato => 'entries', :page => p[:page] } ), { 'q' => p[:q] })
      end

      def search_profiles( p = {} )
        if ! p.has_key?(:page); p[:page] = 0; end
        return @request.execute(replace_url( { :banana => 'search', :potato => 'profiles', :page => p[:page] } ), { 'q' => p[:q] })
      end

      def search_links( p = {} )
        if ! p.has_key?(:page); p[:page] = 0; end
        p.delete(:page)
        return @request.execute(replace_url( { :banana => 'search', :potato => 'links', :page => p[:page] } ), q_url, p)
      end

      def replace_url( p = {} )
        standard_url = "#{@client.configuration.api_host}/banana/potato/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}/paged"
        if ! p.has_key?(:page)
          standard_url = standard_url.gsub(/\/paged/, '')
        else
          standard_url = standard_url.gsub(/paged/, "page,#{p[:page]}")
        end
        return standard_url.gsub(/banana/, p[:banana]).gsub(/potato/, p[:potato])
      end
    end
  end
end