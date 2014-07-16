App.PieceView = Ember.View.extend
  classNameBindings: ['pieceClass']
  model: Em.computed.alias 'controller.model'

  pieceClass: ( ->
    @get('model.player.color') + "_" + @get('model.kind')
  ).property('model.kind', 'model.player.color')

  name: ( ->
    @get('model.kind').charAt(0)
  ).property('model.kind')
