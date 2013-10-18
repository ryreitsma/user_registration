class Batman.RegexValidator extends Batman.Validator
  @options 'matches', 'message'

  validateEach: (errors, record, key, callback) ->
    value = record.get(key)

    if !value? || !value.match(@options.with)
      #      errors.add key, Batman.translate('errors.format', {attribute: key, message: @options.message})
      errors.add key, 'deze is een beetje stuq'
      callback()

      Batman.Validators.push RegexValidator
