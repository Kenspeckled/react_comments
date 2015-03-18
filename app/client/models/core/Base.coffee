PublishSubscribe = require './modules/pubSub.coffee'
class Base
  @extend = (args...) ->
    _class = this
    args.forEach (module) ->
      if module.constructor != Object
        throw new Error('Arguments not an object or a list of objects')
      if !module.moduleName
        throw new Error('Module defined without a name')
      for prop of module
        _class[prop] = module[prop] unless prop == 'moduleName'
      _class.extendedModules = [] if !_class.extendedModules
      _class.extendedModules.push(module.moduleName)

  @include = (args...) ->
    _class = this
    args.forEach (module) ->
      if module.constructor != Object
        throw new Error('Arguments not an object or a list of objects')
      if !module.moduleName
        throw new Error('Module defined without a name')
      for prop of module
        _class.prototype[prop] = module[prop] unless prop == 'moduleName'
      _class.includedModules = [] if !_class.includedModules
      _class.includedModules.push(module.moduleName)

  @extend PublishSubscribe

module.exports = Base

