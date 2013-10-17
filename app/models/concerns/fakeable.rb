module Fakeable
  extend ActiveSupport::Concern

  module ClassMethods
    def fake(params = {})
      new(params).tap do |fake_me|
        fake_me.id = rand(2**20)
        fake_me.updated_at = fake_me.created_at = Time.now
      end
    end
  end
end
