module ProtectsFromSpam
  def protect_from_spam(options = {})
    include Filters

    before_filter :ensure_not_spam, options
  end

  module Filters
    def ensure_not_spam
      if honeypot_field.present?
        honeypot_response
      end
    end

    def honeypot_field
      params[honeypot_field_name]
    end

    def honeypot_response
      head :ok
    end

    def honeypot_field_name
      Rails.application.config.honeypot_field_name
    end
  end
end

