# frozen_string_literal: true

require "active_support/concern"
require "paper_boy/railtie" if defined?(Rails)
require "paper_boy/version"

module PaperBoy
  extend ActiveSupport::Concern

  IGNORE_IVARS = %w[
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

  included do
    after_action :paper_boy_deliver!
  end

  private

    def paper_boy_deliver!
      ActiveSupport::Notifications.instrument(paper_boy_event_name, paper_boy_context)
    end

    def paper_boy_event_name
      "#{params[:action]}.#{params[:controller]}"
    end

    def paper_boy_context
      instance_variable_names.each_with_object({}) do |name, payload|
        next if IGNORE_IVARS.include?(name)
        payload[name.sub(/\A@_?/, "")] = instance_variable_get(name)
      end.compact
    end
end
