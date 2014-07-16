App.Piece = DS.Model.extend
  kind: DS.attr 'string'
  player: DS.belongsTo 'player'
  board: DS.belongsTo 'board'
  x: DS.attr 'number'
  y: DS.attr 'number'
