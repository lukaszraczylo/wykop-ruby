module Wykop
	module Operations
		class Request
			def initialize(client)
				@client = client
			end

			def execute(req_url = nil, req_data = nil)
				sorted_request_body = Hash[req_data.sort_by { |key, value| key }]
				i = 0
				q_body_parsed = ""
				sorted_request_body.each do |sval|
					if i < sorted_request_body.count - 1
						q_body_parsed = "#{q_body_parsed}#{sval[1]}"
					else
						q_body_parsed = "#{q_body_parsed},#{sval[1]}"					
					end
					q_body_parsed = q_body_parsed.gsub(/^,/, '')
					i += 1
				end
      	request_signature = Digest::MD5.hexdigest(@client.configuration.app_user_secret + req_url + q_body_parsed)
      	result = HTTParty.post(req_url.to_s, :body => req_data, :headers => { "apisign" => request_signature } )
      	return result
			end
		end
	end
end