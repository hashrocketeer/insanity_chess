App.BoardController = Ember.ObjectController.extend
  rows: Em.computed.alias 'model.spaces'

  selectedPieces: []

  selectPiece: (piece) ->
    @get('selectedPieces').addObject(piece)
    piece.set 'isSelected', true

  deselectPiece: (piece) ->
    @get('selectedPieces').removeObject(piece)
    piece.set 'isSelected', false

  selectSinglePiece: (piece) ->
    @clearSelected()
    @set 'selectedPieces', [piece]
    piece.set 'isSelected', true

  deselectAllPieces: ->
    @clearSelected()
    @set 'selectedPieces', []

  clearSelected: ->
    @get('selectedPieces').forEach (piece) -> piece.set 'isSelected', false
