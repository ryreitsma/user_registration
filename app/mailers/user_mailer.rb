class UserMailer < ActionMailer::Base
  helper 'mailers/user_mailer'
  default from: "info@coconutcenter.com"

  include ActionView::Helpers::AssetTagHelper

  layout "user_mail"

  def registration_email(user)
    @user = user
    mail(to: "#{@user.name} <#{@user.email}>", subject: "Inschrijving Coconut Mobile App")
  end

  def invitation_email(invitation)
    @invitation = invitation
    mail(to: "#{invitation.recipient_name} <#{invitation.recipient_email}>", subject: "Uitnodiging Coconut Mobile App")
  end
end
