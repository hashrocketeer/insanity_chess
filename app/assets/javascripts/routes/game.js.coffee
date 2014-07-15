App.GameRoute = Ember.Route.extend

  model: (params) ->
    @store.find 'game', params.id
