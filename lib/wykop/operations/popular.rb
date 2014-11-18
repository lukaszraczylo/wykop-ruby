module Wykop
  module Operations
    class Popular
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def popular_show( p = {} )
        if ! p.has_key?(:category); p[:category] = 'promoted'; end
        q_url = @request.replace_url({ :banana => 'popular', :potato => p[:category]})
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end
    end
  end
end