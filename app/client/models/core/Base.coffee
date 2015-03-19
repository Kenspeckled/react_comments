PublishSubscribe = require './modules/pubSub.coffee'
class Base
  @extend = (args...) ->
    _class = this
    args.forEach (module) ->
      if module.constructor != Object
        throw new Error('Arguments not an object or an array of objects')
      for prop of module
        _class[prop] = module[prop] unless prop == 'moduleName'
      afterExtend = _class.afterExtend
      afterExtend(module) if afterExtend

  afterExtend: (module) ->
    if !module.moduleName
      throw new Error('Module defined without a name')
    @extendedModules = [] if !@extendedModules
    @extendedModules.push(module.moduleName)

  @include = (args...) ->
    _class = this
    args.forEach (module) ->
      if module.constructor != Object
        throw new Error('Arguments not an object or an array of objects')
      for prop of module
        _class.prototype[prop] = module[prop] unless prop == 'moduleName'
      afterInclude = _class.afterInclude
      afterInclude(module) if afterInclude

  afterInclude: (module) ->
    if !module.moduleName
      throw new Error('Module defined without a name')
    @includedModules = [] if !@includedModules
    @includedModules.push(module.moduleName)

  @extend PublishSubscribe

module.exports = Base

