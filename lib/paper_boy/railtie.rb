# frozen_string_literal: true

require 'rails/railtie'

module ActiveModel
  class Railtie < Rails::Railtie
    generators do |app|
      Rails::Generators.configure! app.config.generators
      require_relative '../generators/controller_override'
    end
  end
end

module PaperBoy
  class Railtie < Rails::Railtie
    config.after_initialize do |app|
      app.config.paths.add 'app/subscribers', eager_load: true, glob: "**/*_subscriber.rb"
    end

    config.to_prepare do
      Dir[Rails.root.join("app", "subscribers", "**", "*_subscriber.rb")].each { |f| require(f) }
    end
  end
end
