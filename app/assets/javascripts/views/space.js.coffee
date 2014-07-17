App.SpaceView = Ember.View.extend
  tagName: 'span'
  classNames: ['space']
  attributeBindings: ['data-x', 'data-y']
  board: Em.computed.alias 'controller.controllers.board'
  model: Em.computed.alias 'controller.model'

  'data-x': Em.computed.alias 'model.x'
  'data-y': Em.computed.alias 'model.y'

  mouseDown: (event) ->
    if event.which is 3
      @get('board').movePieces(@get('model.x'), @get('model.y'))
