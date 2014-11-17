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
      if CLIENT.info('login').nil?
        fail "Can't log in"
      end
    end
  end

  # Checking all available methods
  # We skip 'add_new' to avoid spamming
  # We skip 'observatory_entries_comments' as it throws internal API error.
  available_methods = CLIENT.methods(false).sort - [:add_new, :execute, :replace_url, :login, :observatory_entries_comments]
  available_methods.each do |mthd|
    it "- method check: #{mthd}" do
      params = nil
      # Weird functions specific
      if mthd.to_s == 'search_index'
        params = { :q => 'potato' }
      elsif mthd.to_s == 'search_profiles'
        params = { :q => 'ouna-' }
      end
      if params.nil?
        client_request = CLIENT.send(mthd)
      else
        client_request = CLIENT.send(mthd, params)
      end
      if client_request.is_a?(Hash)
        # Wykop API throws errors only with Hash
        if client_request.has_key?('error')
          fail
        end
      end
    end
  end
end