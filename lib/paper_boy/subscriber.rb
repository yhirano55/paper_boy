require "active_support/subscriber"

module PaperBoy
  module Subscriber
    class Base < ActiveSupport::Subscriber
      include ActiveSupport::Rescuable

      def logger
        Rails.logger
      end
    end
  end
end
