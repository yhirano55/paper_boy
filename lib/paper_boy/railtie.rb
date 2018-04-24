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
    config.paper_boy = ActiveSupport::OrderedOptions.new
    config.paper_boy.ignore_ivars = %w[
      @_action_has_layout
      @_routes
      @_request
      @_response
      @_lookup_context
      @_action_name
      @_response_body
      @marked_for_same_origin_verification
      @_config
      @_db_runtime
      @_view_context_class
      @_view_renderer
      @_url_options
      @_view_runtime
      @_params
    ]
    config.paper_boy.skip_ignore_ivars = []

    config.after_initialize do |app|
      app.config.paths.add 'app/subscribers', eager_load: true, glob: "**/*_subscriber.rb"
    end

    config.to_prepare do
      Dir[Rails.root.join("app", "subscribers", "**", "*_subscriber.rb")].each { |f| require(f) }
    end
  end
end
