module Rails
  module Generators
    class SubscriberGenerator < NamedBase
      source_root File.expand_path("templates", __dir__)
      check_class_collision suffix: "Subscriber"

      def create_subscriber
        template "subscriber.rb.tt", File.join("app/subscribers", class_path, "#{file_name}_subscriber.rb")
      end

      hook_for :test_framework
    end
  end
end
