PublishSubscribe = require './modules/pubSub.coffee'

class Base
  @include = (args...) ->
    _prototype = @prototype
    args.forEach (module) ->
      if module.constructor != Object
        throw new Error('Arguments not an object or an array of objects')
      for prop of module
        _prototype[prop] = module[prop] unless prop == 'moduleName'
      afterInclude = _prototype.afterInclude
      afterInclude(module) if afterInclude

  afterInclude: (module) ->
    if !module.moduleName
      throw new Error('Module defined without a name')
    @includedModules = [] if !@includedModules
    @includedModules.push(module.moduleName)

  @include PublishSubscribe

module.exports = Base

