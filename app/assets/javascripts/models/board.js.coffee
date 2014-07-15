App.Board = DS.Model.extend
  game: DS.belongsTo 'game'
  spaces: DS.attr 'string'

  parsedSpaces: (->
    JSON.parse @get('spaces')
  ).property('spaces')
