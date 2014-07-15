App.GameCreator = Ember.Object.extend

  newGame: ->
    game = @get('store').createRecord 'game'
    game.set('board', @createBoard())
    return game

  createBoard: ->
    @get('store').createRecord 'board', spaces: @initializeSpaces()

  initializeSpaces: ->
    spaces = []
    for x in [0..69]
      spaces[x] = []
      for y in [0..34]
        spaces[x][y] = { pieces: null }

    JSON.stringify spaces
