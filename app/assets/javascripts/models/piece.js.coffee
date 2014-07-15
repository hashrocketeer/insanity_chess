App.Piece = DS.Model.extend
  kind: DS.attr 'string'
  space: DS.belongsTo 'space'
