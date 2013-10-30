class UserRegistration.UsersController extends UserRegistration.ApplicationController
  routingKey: 'users'

  new: (params) ->
    @set('user', new UserRegistration.User)
    @set('showInvitationFeedback', false)
    @setInvitation()

  create: (params) ->
    return unless @user.isNew

    @user.save( =>
      @set('done', true)
    )

  createInvitation: (params) ->
    @invitation.save( (ErrorSet, Invitation) =>
      if (ErrorSet is undefined)
        @setInvitation Invitation.get('inviter_name')
        @set('showInvitationFeedback', true)
    )

  setInvitation: (inviter_name) ->
    @set('invitation', new UserRegistration.Invitation)
    @invitation.set('inviter_name', inviter_name) if inviter_name isnt undefined

