require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "User session" do
  it "have credentials" do
    if ENV['WYKOP_CFG_USER_KEY'].empty? ||
      ENV['WYKOP_CFG_USER_SECRET'].empty? ||
      ENV['WYKOP_CFG_USER_NAME'].empty? ||
      ENV['WYKOP_CFG_GEN_SECRET'].empty?
      fail "No ENV credentials specified."
    end
  end

  it "can check profile / log in" do
    if CLIENT.login
      client_request = CLIENT.info
      if client_request.has_key?('error')
        message = "Error! Code: #{client_request['error']['code']} => #{client_request['error']['message']}"
        fail message
      elsif client_request.nil?
        fail "Can't log in"
      end
    end
  end

  # Checking all available methods
  # We skip 'add_new' to avoid spamming
  # We skip 'observatory_entries_comments' as it throws internal API error.
  available_methods = CLIENT.methods(false).sort - [:add_new, :execute, :replace_url, :login, :observatory_entries_comments, :related_add]
  available_methods.each do |mthd|
    it "- method check: #{mthd}" do
      params = nil
      # Weird functions specific
      if mthd.to_s == 'search_index'
        params = { :q => 'potato' }
      elsif mthd.to_s == 'search_profiles'
        params = { :q => 'ouna-' }
      elsif mthd.to_s =~ /related_vote_.*/
        params = { :param1 => 2242488, :param2 => 27794764 }
      elsif mthd.to_s == 'favorite_index'
        params = { :param1 => 56072 }
      elsif mthd.to_s =~ /messages_(read|delete)/
        params = { :param1 => 'ouna-' }
      elsif mthd.to_s == 'message_send'
        params = { :param1 => 'ouna-', :body => 'test wykop gem' }
      end
      if params.nil?
        client_request = CLIENT.send(mthd)
      else
        client_request = CLIENT.send(mthd, params)
      end
      if client_request.is_a?(Hash)
        # Wykop API throws errors only with Hash
        if client_request.has_key?('error') || client_request =~ /.*<title>Ups...<\/title>.*/ 
          if client_request['error']['code'] != 112
            # Ignoring error 112 ( user doesn't accept messages )
            message = "Error! Code: #{client_request['error']['code']} => #{client_request['error']['message']}"
            fail message
          end
        end
      end
    end
  end
end