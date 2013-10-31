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
        @set('showInvitationFeedback', true)
    )

  setInvitation: (inviter_name) ->
    @set('invitation', new UserRegistration.Invitation)
    @invitation.set('inviter_name', inviter_name) if inviter_name isnt undefined