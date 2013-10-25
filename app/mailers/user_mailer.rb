class UserMailer < ActionMailer::Base
  helper 'mailers/user_mailer'
  default from: "info@coconutcenter.com"

  include ActionView::Helpers::AssetTagHelper

  layout "user_mail"

  def registration_email(user)
    @user = user
    mail(to: "#{@user.name} <#{@user.email}>", subject: "Inschrijving Coconut Mobile App")
  end
end
