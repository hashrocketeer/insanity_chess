App.BoardView = Ember.View.extend
  tagName: 'section'
  elementId: 'board'

  didInsertElement: ->
    @disableContextMenu()

  disableContextMenu: ->
    document.oncontextmenu = -> return false
