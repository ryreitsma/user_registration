class UserRegistration.UsersController extends UserRegistration.ApplicationController
  routingKey: 'users'

  index: (params) ->
    @set('users', UserRegistration.User.get('all').sortedBy('name'))

  show: (params) ->

  edit: (params) ->

  new: (params) ->
    @set('user', new UserRegistration.User)

  create: (params) ->
    @user.save =>
      @set('done', true)

  update: (params) ->

  destroy: (params) ->

