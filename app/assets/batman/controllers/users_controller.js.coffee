class UserRegistration.UsersController extends UserRegistration.ApplicationController
  routingKey: 'users'

  index: (params) ->
    @set('users', UserRegistration.User.get('all'))

  new: (params) ->
    @set('user', new UserRegistration.User)

  create: (params) ->
    @user.save =>
      @set('done', true)
