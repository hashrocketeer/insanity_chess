App.PieceView = Ember.View.extend
  classNameBindings: ['pieceClass', 'isSelected:selected']
  model: Em.computed.alias 'controller.model'
  boardController: Em.computed.alias 'controller.controllers.board'
  selectedPieces: Em.computed.alias 'boardController.selectedPieces'
  isSelected: Em.computed.alias 'model.isSelected'

  pieceClass: ( ->
    @get('model.player.color') + "_" + @get('model.kind')
  ).property('model.kind', 'model.player.color')

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
