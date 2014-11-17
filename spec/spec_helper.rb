$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'wykop'
require 'rspec'

CFG_USER_KEY    = ENV['WYKOP_CFG_USER_KEY']
CFG_USER_SECRET = ENV['WYKOP_CFG_USER_SECRET']
CFG_USER_NAME   = ENV['WYKOP_CFG_USER_NAME']
CFG_GEN_SECRET  = ENV['WYKOP_CFG_GEN_SECRET']

CLIENT = Wykop::Client.new({ app_user_key: CFG_USER_KEY, app_user_secret: CFG_USER_SECRET,app_username: CFG_USER_NAME, app_generated_key: CFG_GEN_SECRET, api_host: 'http://a.wykop.pl' })