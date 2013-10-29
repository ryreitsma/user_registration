Batman.DOM.readers.openwhen = (definition) ->
  new Batman.DOM.OpenBinding(definition)

Batman.DOM.readers.closewhen = (definition) ->
  new Batman.DOM.CloseBinding(definition)

class Batman.DOM.OpenBinding extends Batman.DOM.AbstractBinding
  onlyObserve: Batman.BindingDefinitionOnlyObserve.Data

  dataChange: (value) ->
    view = Batman.View.viewForNode(@node, false)

    if value
      view?.fire('viewWillShow')

      if view?.open?
        view.open()
        view?.fire('viewDidShow')
      else
        jQuery(@node).slideDown(
          complete: (=>
            view?.fire('viewDidShow')
          )
        )
    else
      @node.style.display = 'none'

class Batman.DOM.CloseBinding extends Batman.DOM.AbstractBinding
  onlyObserve: Batman.BindingDefinitionOnlyObserve.Data

  dataChange: (value) ->
    view = Batman.View.viewForNode(@node, false)

    if value
      view?.fire('viewWillHide')

      if view?.close?
        view.close()
        view?.fire('viewDidHide')
      else
        jQuery(@node).slideUp(
          complete: (=>
            view?.fire('viewDidHide')
          )
        )

