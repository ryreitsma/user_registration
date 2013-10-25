module Mailers
  module UserMailerHelper
    def image_tag_from_asset(image_name, options = {})
      url = attach_asset(image_name)
      image_tag(url, options)
    end

    def attach_asset(asset_name)
      asset = Rails.application.assets[asset_name]
      attachments.inline[asset_name] ||= asset.source
      attachments.inline[asset_name].url
    end
  end
end
