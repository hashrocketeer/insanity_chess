App.Router.reopen
  location: 'auto'

App.Router.map () ->
  @resource 'game', { path: '/game/:id' }
