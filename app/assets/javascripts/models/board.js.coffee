App.Board = DS.Model.extend
  game: DS.belongsTo 'game'
  rawSpaces: DS.attr 'string'

  spaces: (-> JSON.parse @get('rawSpaces')).property('rawSpaces')

  updateSpaces: ->
    @set 'rawSpaces', JSON.stringify(@get('spaces'))
    @save()

  height: Em.computed.alias 'spaces.length'
  width: Em.computed.alias 'spaces.firstObject.length'
