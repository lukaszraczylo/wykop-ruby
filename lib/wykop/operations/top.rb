require 'chronic'

module Wykop
  module Operations
    class Top
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def top_index(year = nil)
        if year.nil?
          year = Chronic.parse('last year').strftime("%Y")
        end
        q_url = replace_url('top', 'index', year)
        q_body = Hash.new
        @request.execute(q_url, q_body)
      end

      def top_date(year = nil, month = 1, page = 0)
        if year.nil?
          year = Chronic.parse('last year').strftime("%Y")
        end
        q_url = replace_url('top', 'date', year, month)
        q_body = {'page' => page}
        @request.execute(q_url, q_body)
      end

      def top_hits
        q_url = replace_url('top', 'hits')
        q_body = Hash.new
        @request.execute(q_url, q_body)
      end

      def replace_url(banana = nil, potato = nil, year = nil, month = nil)
        standard_url = "#{@client.configuration.api_host}/banana/potato/param1/param2/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}"
        # Checking parameters existence and removing them from url, just in case
        if year
          ret_url = standard_url.gsub(/param1/, year.to_s)
        else
          ret_url = standard_url.gsub(/\/param1/, '')
        end
        if month
          ret_url = standard_url.gsub(/param2/, month.to_s)
        else
          ret_url = standard_url.gsub(/\/param2/, '')
        end
        return ret_url.gsub(/banana/, banana).gsub(/potato/, potato)
      end
    end
  end
end