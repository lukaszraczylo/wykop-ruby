module Wykop
  module Operations
    class Tag
      # Documentation: http://www.wykop.pl/dla-programistow/dokumentacja/#info6_17
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end
    end
  end
end