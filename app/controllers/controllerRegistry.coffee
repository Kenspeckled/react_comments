ActionController = require '../models/actionController.coffee'
commentsControllerActions = require './commentsController.coffee'

controllerRegistry = ->
  ActionController.registerListenersOn(commentsControllerActions)

module.exports = controllerRegistry
