App.Player = DS.Model.extend
  color: DS.attr 'string'
  pieces: DS.hasMany 'piece'
