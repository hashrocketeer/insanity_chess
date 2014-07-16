App.GameRoute = Ember.Route.extend

  model: (params) ->
    new Ember.RSVP.Promise (resolve, reject) =>
      @store.find('game', params.id).then (game) =>
        @store.find('board', game: game.get('id')).then (boards) =>
          id = boards.get('firstObject.id')
          @store.find('piece', board: id).then =>
            resolve(game)
