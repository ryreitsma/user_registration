class InvitationsController < ApplicationController
  protect_from_spam only: :create

  # POST /invitation
  # POST /invitation.json
  def create
    @invitation = Invitation.new(invitation_params)

    if @invitation.save
      UserMailer.invitation_email(@invitation).deliver
      render json: @invitation, status: :created
    else
      render json: @invitation.errors, status: :unprocessable_entity
    end
  end

private
  def invitation_params
    @invitation_params ||= params[:invitation].permit(:inviter_name, :recipient_name, :recipient_email)
  end

  def honeypot_field
    params[:invitation][honeypot_field_name]
  end

  def honeypot_response
    render json: Invitation.fake(invitation_params), status: :created
  end
end
