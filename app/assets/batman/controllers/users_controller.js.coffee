class UserRegistration.UsersController extends UserRegistration.ApplicationController
  routingKey: 'users'

  new: (params) ->
    @set('user', new UserRegistration.User)
    @set('doe', true)
    @SetInvitation()

  create: (params) ->
    @user.save( =>
      @set('done', true)
    )

  createInvitation: (params) ->
    @invitation.save( =>
      @SetInvitation @invitation.get('inviter_name')
    )

  SetInvitation: (inviter_name) ->
    @set('invitation', new UserRegistration.Invitation)
    @invitation.set('inviter_name', inviter_name) if inviter_name isnt undefined

