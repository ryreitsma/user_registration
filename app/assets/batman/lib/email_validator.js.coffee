#= require ./regex_validator

class Batman.EmailValidator extends Batman.RegexValidator
  @options 'matches', 'message'

  validateEach: (errors, record, key, callback) ->
    value = record.get(key)

    if !value? || !value.match(@options.with)
      errors.add key, Batman.translate('errors.format', {attribute: key, message: @options.message})
      callback()

      Batman.Validators.push RegExpValidator

