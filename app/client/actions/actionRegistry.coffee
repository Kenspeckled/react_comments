ActionHandler = require '../models/ActionHandler.coffee'
commentActions = require './commentActions.coffee'

actionRegistry = ->
  ActionHandler.registerListenersOn(commentsActions)

module.exports = actionRegistry
