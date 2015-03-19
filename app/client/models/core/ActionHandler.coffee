Base = require './Base.coffee'
PublishSubscribe = require './modules/pubSub.coffee'

class ActionHandler extends Base
  @extend PublishSubscribe

  # Takes an object and sets the listners on each property to the value of that property
  # i.e @addListener({ actionName: function })
  @registerListenersOn = (actionObj) ->
    throw new Error('Arguments not an object') if actionObj.constructor != Object
    for action of actionObj
      ActionHandler.listen action, actionObj[action]


module.exports = ActionHandler
