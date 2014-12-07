module Wykop
  module Operations
    class Tags
      # Documentation: http://www.wykop.pl/dla-programistow/dokumentacja/#info6_19
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def tags_show
        q_url = @request.replace_url({ :banana => 'tags', :potato => 'index' })
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end
    end
  end
end