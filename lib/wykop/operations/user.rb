module Wykop
  module Operations
    class User
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def login
        # Opening new connection to wykop API. It returns configuration hash and all the client information
        @client.user_info = login_request
        if @client.user_info.nil?
          return false
        end
        return true
      end

      def info(what = nil)
        # Getting information about user account
        if what == nil
          return @client.user_info
        else
          return @client.user_info[what]
        end
      end

      def favorites()
        # Listing favourites for current user
        q_url = @request.replace_url({:banana => 'user', :potato => 'favorites'})
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def observed()
        # Listing observed for current user
        q_url = @request.replace_url({:banana => 'user', :potato => 'observed'})
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def tags()
        # Listing observed for current user
        q_url = @request.replace_url({:banana => 'user', :potato => 'tags'})
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      # Needs to be here, at least till i figure out where to put it

      private

      def login_request(params = nil)
        # Building request URL
        q_body = {'login' => @client.configuration.app_username, 'accountkey' => @client.configuration.app_generated_key}
        q_url = "#{@client.configuration.api_host}/user/login/appkey,#{@client.configuration.app_user_key}"
        @request.execute(q_url, q_body)
      end
    end
  end
end