App.IndexController = Ember.Controller.extend

  actions:

    createGame: ->
      game = App.GameCreator.create(store: @store).newGame()
      @transitionToRoute 'game', game
