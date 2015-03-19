Base = require './baseClass.coffee'
PublishSubscribe = require './modules/pubSub.coffee'

class ActionController extends Base
  @extend PublishSubscribe

  # Takes an object and sets the listners on each property to the value of that property
  # i.e @addListener({ actionName: function })
  @registerListenersOn = (actionObj) ->
    throw new Error('Arguments not an object') if actionObj.constructor != Object
    for action of actionObj
      ActionController.listen action, actionObj[action]


module.exports = ActionController
