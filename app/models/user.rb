require 'email_format_validator'

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, email_format: true

  include Fakeable
end
