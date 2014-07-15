App.SpaceController = Ember.Controller.extend

  piece: ( ->
    @store.find('piece', @get('model.piece')) if @get('model.piece')
  ).property('model.piece')
