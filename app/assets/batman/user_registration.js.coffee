#= require batman/es5-shim

#= require batman/batman
#= require batman/batman.rails

#= require jquery
#= require batman/batman.jquery

#= require batman.i18n

#= require_self

#= require_tree ./lib
#= require_tree ./controllers
#= require_tree ./models
#= require_tree ./views

Batman.config.pathToHTML = '/assets/html'
Batman.I18N.enable()

class UserRegistration extends Batman.App
  @route 'users/new', 'users#new'

  @root 'users#new'

(global ? window).UserRegistration = UserRegistration
