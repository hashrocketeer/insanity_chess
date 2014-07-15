App.Game = DS.Model.extend
  board: DS.belongsTo 'board', async: true
  players: DS.hasMany 'player'
