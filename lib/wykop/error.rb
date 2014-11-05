module Wykop
  module Error
    # Validates Wykop API responses

    class Base < StandardError; end

    class NoApiKeys < Base
      def initialize(msg = "Missing API credentials.")
        super
      end
    end
  end
end