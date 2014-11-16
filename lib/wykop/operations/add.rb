module Wykop
  module Operations
    class Add
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def add_new(p = {})
        # Adding new link
        q_url = replace_url( { :banana => 'add', :potato => 'index', :group => p[:group].gsub(/^\#/, '') } )
        ap q_url
        p.delete(:group)
        q_body = p
        @request.execute(q_url, q_body)
      end

      def replace_url( p = {} )
        standard_url = "#{@client.configuration.api_host}/banana/potato/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}/group,groupid"
        return standard_url.gsub(/banana/, p[:banana]).gsub(/potato/, p[:potato]).gsub(/groupid/, p[:group])
      end
    end
  end
end