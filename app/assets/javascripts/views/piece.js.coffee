App.PieceView = Ember.View.extend
  classNameBindings: ['pieceClass', 'model.isSelected:selected']
  model: Em.computed.alias 'controller.model'
  boardController: Em.computed.alias 'controller.controllers.board'
  selectedPieces: Em.computed.alias 'boardController.selectedPieces'

  pieceClass: ( ->
    @get('model.player.color') + "_" + @get('model.kind')
  ).property('model.kind', 'model.player.color')

  click: ->
    @get('boardController').selectPiece(@get('model'))
    @get('model').set 'isSelected', true
    console.log 'clicked'
