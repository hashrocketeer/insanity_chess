App.BoardController = Ember.ObjectController.extend
  rows: Ember.computed.alias 'model.spaces'

  selectedPieces: []

  selectPiece: (piece) -> @get('selectedPieces').addObject(piece)
