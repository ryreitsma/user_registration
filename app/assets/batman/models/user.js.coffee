class UserRegistration.User extends Batman.Model
  @resourceName: 'users'
  @storageKey: 'users'

  @persist Batman.RailsStorage

  @validate 'name', presence: true
  @validate 'email', presence: true

  # Use @encode to tell batman.js which properties Rails will send back with its JSON.
  @encode 'name', 'email'

  @encodeTimestamps()

