class UserRegistration.UsersController extends UserRegistration.ApplicationController
  routingKey: 'users'

  new: (params) ->
    @set('user', new UserRegistration.User)

  create: (params) ->
    @user.save =>
      @set('done', true)
