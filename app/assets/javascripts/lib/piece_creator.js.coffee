App.PieceCreator = Ember.Object.extend

  startInfo: ( ->
    {
      'white': { startX: 18, startY: 0, direction: 1 }
      'black': { startX: 18, startY: @get('board.height')-1, direction: -1  }
    }
  ).property('board.height')

  initialState: ->
    startInfo = @get('startInfo')[@get('player.color')]
    @setProperties startInfo
    @createPieces()

  createPiece: (kind, x, y) ->
    piece = @get('store').createRecord 'piece', kind: kind, player: @get('player')
    space = @get('board.spaces')[y][x]
    space.piece = piece.id

  createPieces: ->
    @createPiece 'king', @get('startX'), @get('startY')
    @createPiece 'queen', @get('startX') - 1, @get('startY')
    pawnRow = @get('startY') + @get('direction')
    @createPawns(pawnRow)

  createAdvancedPieces: ->
    types = ['bishop', 'knight', 'rook']

    for i in [0..(@get('startX') - 2)]
      @createPiece types[i % 3], i, @get('startY')

    for i in [(@get('startX') + 1)..(@get('board.width') - 1)]
      @createPiece types[i % 3], i, @get('startY')

  createPawns: (row)->
    for i in [0..(@get('board.width') - 1)]
      @createPiece 'pawn', i, row
