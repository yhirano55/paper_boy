module Rspec
  module Generators
    class SubscriberGenerator < ::Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      def create_test_file
        template 'subscriber_spec.rb.tt', File.join('spec/subscribers', class_path, "#{plural_name}_subscriber_spec.rb")
      end
    end
  end
end
