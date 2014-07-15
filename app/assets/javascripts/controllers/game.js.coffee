App.GameController = Ember.Controller.extend

  rows: Ember.computed.alias 'model.board.parsedSpaces'
