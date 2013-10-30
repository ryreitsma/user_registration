class UserRegistration.UsersController extends UserRegistration.ApplicationController
  routingKey: 'users'

  new: (params) ->
    @set('user', new UserRegistration.User)
    @set('doe', true)
    @setInvitation()

  create: (params) ->
    return unless @user.isNew
      
    @user.save( =>
      @set('done', true)
    )

  createInvitation: (params) ->
    @invitation.save( =>
      @setInvitation @invitation.get('inviter_name')
    )

  setInvitation: (inviter_name) ->
    @set('invitation', new UserRegistration.Invitation)
    @invitation.set('inviter_name', inviter_name) if inviter_name isnt undefined

