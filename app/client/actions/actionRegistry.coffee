ActionHandler = require '../models/core/ActionHandler.coffee'
commentsActions = require './commentActions.coffee'

actionRegistry = ->
  ActionHandler.registerListenersOn(commentsActions)

module.exports = actionRegistry
