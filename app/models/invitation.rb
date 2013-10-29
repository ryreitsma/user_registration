require 'email_format_validator'

class Invitation < ActiveRecord::Base
  validates :inviter_name, presence: true
  validates :recipient_name, presence: true
  validates :recipient_email, email_format: true

  include Fakeable
end
