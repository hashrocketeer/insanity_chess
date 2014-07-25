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
    @set('path', [])
    moveFunction = @[@get('kind') + 'MoveTo']
    moveFunction(@, newX, newY)
    @moveAlongPath()

  queenMoveTo: (context, newX, newY) ->
    currentY = context.get('currentY')
    currentX = context.get('currentX')

    diffX = newX - currentX
    diffY = newY - currentY

    nextX = currentX
    nextY = currentY

    xs = []
    ys = []

    for i in [0..diffX]
      nextX = currentX + i
      xs.push nextX

    for i in [0..diffY]
      nextY = currentY + i
      ys.push nextY

    for i in [0..Math.max(xs.length, ys.length)]
      context.get('path').pushObject [context.indexOf(xs, i), context.indexOf(ys, i)]
    context.get('path').shiftObject()

  indexOf: (arr, i) ->
    if i > arr.length - 1
      arr[arr.length - 1]
    else
      arr[i]

  pawnMoveTo: (context, newX, newY) =>
    for nextY in [(context.get('currentY'))..newY]
      context.get('path').pushObject([context.get('currentX'), nextY])
    context.get('path').shiftObject()

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
