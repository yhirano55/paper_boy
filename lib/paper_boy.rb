# frozen_string_literal: true

require "active_support/concern"
require "paper_boy/railtie" if defined?(Rails)
require "paper_boy/subscriber"
require "paper_boy/version"

module PaperBoy
  extend ActiveSupport::Concern

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
        next if ignore_ivars.include?(name)
        payload[name.sub(/\A@_?/, "")] = instance_variable_get(name)
      end.compact
    end

    def ignore_ivars
      Rails.application.config.paper_boy.ignore_ivars - skip_ignore_ivars
    end

    def skip_ignore_ivars
      Rails.application.config.paper_boy.skip_ignore_ivars
    end
end
