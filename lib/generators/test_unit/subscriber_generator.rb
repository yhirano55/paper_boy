module TestUnit
  module Generators
    class SubscriberGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)
      check_class_collision suffix: "SubscriberTest"

      def create_test_file
        template 'subscriber_test.rb.tt', File.join('test/subscribers', class_path, "#{plural_name}_subscriber_test.rb")
      end
    end
  end
end
