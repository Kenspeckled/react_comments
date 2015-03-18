Base = require '../baseClass.coffee'
PublishSubscribe = require './modules/pubSub.coffee'

class ActionController extends Base
  @extend PublishSubscribe

  # Takes an object and sets the listners on each property to the value of that property
  # i.e @addListener({ actionName: function })
  @registerListenersOn = (actionObj) ->
    _class = this
    throw new Error('Arguments not an object') if actionSet.constructor != Object
    for action of actionObj
      _class.listen action, actionSet[action]


module.exports = ActionController
