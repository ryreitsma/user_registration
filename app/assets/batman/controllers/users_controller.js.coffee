class UserRegistration.UsersController extends UserRegistration.ApplicationController
  routingKey: 'users'

  new: (params) ->
    @set('user', new UserRegistration.User)

  create: (params) ->
    return unless @user.isNew

    @user.save( =>
      @set('done', true)
    )
