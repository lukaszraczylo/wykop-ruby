require 'wykop/version'
require 'wykop/client'

module Wykop
  def self.client
    @client ||= Wykop::Client.new
  end
end
