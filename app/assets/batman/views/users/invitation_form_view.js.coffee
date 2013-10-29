class UserRegistration.InvitationFormView extends Batman.View
  source: 'users/invitation'

  @accessor 'submitted', ->
    not @get('controller.user.isNew')

  constructor: ->
    super

    @observe('submitted', (submitted) ->
      $(@node).slideUp() if submitted
    )

