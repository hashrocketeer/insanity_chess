App.GameCreator = Ember.Object.extend

  newGame: ->
    game = @get('store').createRecord 'game'
    game.save().then (game) =>
      @createBoard(game).save().then (board) =>
        players = @createPlayers(board)
        game.set 'thisPlayer', players.get('firstObject')
        game.set('board', board)
        game.save()
    return game

  createPlayers: (board) ->
    ['white', 'black'].map (color) =>
      player = @get('store').createRecord 'player', color: color
      player.save().then =>
        App.PieceCreator.create(store: @store, board: board, player: player).initialState()
      player

  createBoard: (game) ->
    @get('store').createRecord 'board',
      rawSpaces: @initializeSpaces()
      game: game

  initializeSpaces: ->
    spaces = []
    for x in [0..69]
      spaces[x] = []
      for y in [0..34]
        spaces[x][y] = { x: x, y: y, piece: null }

    JSON.stringify spaces
