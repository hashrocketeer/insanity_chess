App.ApplicationView = Ember.View.extend

  click: ->
    @get('controller.controllers.board').deselectAllPieces()
