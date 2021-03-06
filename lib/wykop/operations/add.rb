module Wykop
  module Operations
    class Add
      # Documentation: http://www.wykop.pl/dla-programistow/dokumentacja/#info6_9
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def add_new(p = {})
        # Adding new link
        p.delete(:group)
        @request.execute(replace_url( { :banana => 'add', :potato => 'index', :group => p[:group].gsub(/^\#/, '') } ), p)
      end

      def replace_url( p = {} )
        standard_url = "#{@client.configuration.api_host}/banana/potato/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}/group,groupid"
        return standard_url.gsub(/banana/, p[:banana]).gsub(/potato/, p[:potato]).gsub(/groupid/, p[:group])
      end
    end
  end
end