App.Router.reopen
  location: 'history'
  rootURL: '/'

App.Router.map ->
  @resource 'users', ->
    @route 'new'
    @route 'show',
      path: '/:user_id'
    @route 'edit',
      path: '/:user_id/edit'

App.IndexRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'home')

App.UsersIndexRoute = Ember.Route.extend
  model: ->
    App.User.find()
  setupController: (controller, model) ->
    controller.set('users', model)
    @controllerFor('application').set('currentRoute', 'users')

App.UsersShowRoute = Ember.Route.extend    
  model: (params) ->
    App.User.find(params.user_id)
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'users')

App.UsersNewRoute = Ember.Route.extend
  model: ->
    App.User.createRecord()
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'users')

App.UsersEditRoute = Ember.Route.extend
  model: (params) ->
    App.User.find(params.user_id)
  setupController: (controller, model) ->
    controller.set('content', model)
    @controllerFor('application').set('currentRoute', 'users')
