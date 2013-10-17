module ProtectsFromSpam
  def protect_from_spam(options = {})
    include Filters

    before_filter :ensure_not_spam, options
  end

  module Filters
    def ensure_not_spam
      current_action = params[:action]

      if honeypot_for(current_action).present?
        honeypot_response_for(current_action)
      end
    end

    def honeypot_for(action)
      params[:extra_info]
    end

    def honeypot_response_for(action)
      head :ok
    end

    def honeypot_field_name
      Rails.application.config.honeypot_field_name
    end
  end
end

