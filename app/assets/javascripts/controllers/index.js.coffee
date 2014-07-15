App.IndexController = Ember.Controller.extend

  actions:

    createGame: ->
      game = App.GameCreator.create(store: @store).newGame()
      game.save()
      game.get('board').then (board) => board.save()
      @transitionTo 'game', game
