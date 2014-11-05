module Wykop
	module Operations
		class Observatory
			def initialize(client)
				@client = client
				@request = Wykop::Operations::Request.new(@client)
			end

			def observatory_votes
				q_url = replace_url('observatory', 'votes')
				q_body = Hash.new
				@request.execute(q_url, q_body)
			end

			def observatory_comments
				q_url = replace_url('observatory', 'comments')
				q_body = Hash.new
				@request.execute(q_url, q_body)
			end			

			def observatory_entries
				q_url = replace_url('observatory', 'entries')
				q_body = Hash.new
				@request.execute(q_url, q_body)
			end

			def observatory_entries_comments
				q_url = replace_url('observatory', 'entries_comments')
				q_body = Hash.new
				@request.execute(q_url, q_body)
			end

      def replace_url( banana = nil, potato = nil)
      	standard_url = "#{@client.configuration.api_host}/banana/potato/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}"
      	return standard_url.gsub(/banana/, banana).gsub(/potato/, potato)
      end
		end
	end
end