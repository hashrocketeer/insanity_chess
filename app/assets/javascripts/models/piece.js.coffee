App.Piece = DS.Model.extend
  kind: DS.attr 'string'
  player: DS.belongsTo 'player'
