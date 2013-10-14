class UserRegistration.UsersController extends UserRegistration.ApplicationController
  routingKey: 'users'

  @beforeAction 'fetchUser', only: 'show'

  index: (params) ->
    @set('users', UserRegistration.User.get('all'))

  show: (params) ->

  edit: (params) ->

  new: (params) ->
    @set('user', new UserRegistration.User)

  create: (params) ->
    @user.save =>
      @set('done', true)

  update: (params) ->

  destroy: (params) ->

  fetchUser: (params) ->
    UserRegistration.User.find params.id, @errorHandler (list) =>
      @set('user', list)
