App.Piece = DS.Model.extend
  kind: DS.attr 'string'
  player: DS.belongsTo 'player'
  board: DS.belongsTo 'board'
  x: DS.attr 'number'
  y: DS.attr 'number'

  currentX: Em.computed.alias 'x'
  currentY: Em.computed.alias 'y'

  path: []

  moveTo: (newX, newY) ->
    currentY = @get('currentY')
    currentX = @get('currentX')
    for nextY in [(currentY + 1)..newY]
      @get('path').pushObject([currentX, nextY])
    @moveAlongPath()

  moveAlongPath: ->
    if !Em.isEmpty(@get('path'))
      newPosition = @get('path').shiftObject()
      @set 'x', newPosition[0]
      @set 'y', newPosition[1]
      Ember.run.later @, ( => @moveAlongPath()), @get('speed')

  speed: ( ->
    return 0 if App.CucumberTestMode
    App.PieceSpeeds[@get('kind')]
  ).property('kind')
