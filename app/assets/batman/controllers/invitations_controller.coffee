class UserRegistration.InvitationsController extends UserRegistration.ApplicationController
  routingKey: 'invitations'

  constructor: ->
    super
    @setInvitation()
    @set('showInvitationFeedback', false)

  create: (params) ->
    @invitation.save( (ErrorSet, Invitation) =>
      if (ErrorSet is undefined)
        @setInvitation Invitation.get('inviter_name')
        @showInvitationFeedBack()
    )

  showInvitationFeedBack: ->
    @set('showInvitationFeedback', true)
    observer =  (newValue) =>
      console.log "observer is working"
      if newValue
        @set('showInvitationFeedback', false)
        @invitation.forget "recipient_name", observer
        @invitation.forget "recipient_email", observer


    @invitation.observe "recipient_name", observer
    @invitation.observe "recipient_email", observer

  setInvitation: (inviter_name) ->
    @set('invitation', new UserRegistration.Invitation)
    @invitation.set('inviter_name', inviter_name) if inviter_name isnt undefined

