class UserRegistration.UsersFormView extends Batman.View
  source: 'users/form'

  @accessor 'submitted', ->
    not @get('controller.user.isNew')

  constructor: ->
    super

    @observe('submitted', (submitted) ->
      $(@node).slideUp() if submitted
    )

