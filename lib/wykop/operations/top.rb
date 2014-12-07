require 'chronic'

module Wykop
  module Operations
    class Top
      # Documentation: http://www.wykop.pl/dla-programistow/dokumentacja/#info6_8
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def top_index( p = {} )
        if ! p.has_key?(:year); p[:year] = Chronic.parse('last year').strftime("%Y"); end
        q_url = replace_url({ :banana => 'top', :potato => 'index', :year => p[:year]})
        q_body = Hash.new
        @request.execute(q_url, q_body)
      end

      def top_date( p = {} )
        if ! p.has_key?(:page); p[:page] = 0; end
        if ! p.has_key?(:month); p[:month] = 1; end
        if ! p.has_key?(:year); p[:year] = Chronic.parse('last year').strftime("%Y"); end
        q_url = replace_url({ :banana => 'top', :potato => 'date' }.merge(p))
        q_body = {'page' => p[:page]}
        @request.execute(q_url, q_body)
      end

      def top_hits
        q_url = replace_url({ :banana => 'top', :potato => 'hits'})
        q_body = Hash.new
        @request.execute(q_url, q_body)
      end

      def replace_url( p = {} )
      # def replace_url(banana = nil, potato = nil, year = nil, month = nil)
        standard_url = "#{@client.configuration.api_host}/banana/potato/param1/param2/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}"
        # Checking parameters existence and removing them from url, just in case
        if p.has_key?(:year)
          standard_url = standard_url.gsub(/param1/, p[:year].to_s)
        else
          standard_url = standard_url.gsub(/\/param1/, '')
        end
        if p.has_key?(:month)
          standard_url = standard_url.gsub(/param2/, p[:month].to_s)
        else
          standard_url = standard_url.gsub(/\/param2/, '')
        end
        return standard_url.gsub(/banana/, p[:banana]).gsub(/potato/, p[:potato])
      end
    end
  end
end