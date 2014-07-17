App.PieceView = Ember.View.extend
  classNameBindings: ['model.player.color', 'model.kind', 'isSelected:selected']
  attributeBindings: ['data-id', 'data-x', 'data-y', 'computedStyle:style']
  model: Em.computed.alias 'controller.model'
  boardController: Em.computed.alias 'controller.controllers.board'
  selectedPieces: Em.computed.alias 'boardController.selectedPieces'
  isSelected: Em.computed.alias 'model.isSelected'

  'data-id': Em.computed.alias 'model.id'
  'data-x': Em.computed.alias 'model.x'
  'data-y': Em.computed.alias 'model.y'

  computedStyle: ( ->
    @get('positionStyle') + @get('transitionStyle')
  ).property('positionStyle', 'transitionStyle')

  positionStyle: ( ->
    left = @get('model.x') * 31
    top = @get('model.y') * 31
    "left: #{left}px; top: #{top}px;"
  ).property('model.x', 'model.y')

  transitionStyle: ( ->
    "transition-duration: #{@get('model.speed')}ms"
  ).property('model.speed')

  click: (event) ->
    @handleClickSelection(event)
    return false

  handleClickSelection: (event) ->
    if event.shiftKey
      @toggleMe()
    else
      @selectMeOnly()

  toggleMe: ->
    if @get('isSelected')
      @deselectMe()
    else
      @selectMe()

  selectMe: ->
    @get('boardController').selectPiece(@get('model'))

  deselectMe: ->
    @get('boardController').deselectPiece(@get('model'))

  selectMeOnly: ->
    @get('boardController').selectSinglePiece(@get('model'))
