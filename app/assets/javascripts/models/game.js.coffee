App.Game = DS.Model.extend
  board: DS.belongsTo 'board'
  players: DS.hasMany 'player'
