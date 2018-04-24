module PaperBoy
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def copy_application_loyalty
        copy_file "application_subscriber.rb.tt", "app/subscribers/application_subscriber.rb"
      end
    end
  end
end
