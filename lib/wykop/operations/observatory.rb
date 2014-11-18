module Wykop
  module Operations
    class Observatory
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def observatory_votes
        q_url = @request.replace_url({ :banana => 'observatory', :potato => 'votes'})
        q_body = Hash.new
        @request.execute(q_url, q_body)
      end

      def observatory_comments
        q_url = @request.replace_url({ :banana => 'observatory', :potato => 'comments'})
        q_body = Hash.new
        @request.execute(q_url, q_body)
      end

      def observatory_entries
        q_url = @request.replace_url({:banana => 'observatory', :potato => 'entries'})
        q_body = Hash.new
        @request.execute(q_url, q_body)
      end

      def observatory_entries_comments
        q_url = @request.replace_url({:banana => 'observatory', :potato => 'entries_comments'})
        q_body = Hash.new
        @request.execute(q_url, q_body)
      end
    end
  end
end