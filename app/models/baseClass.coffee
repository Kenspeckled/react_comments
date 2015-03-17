class Base

  includeModule = (module, _prototype) ->
    afterInclude = _prototype.afterInclude 
    for prop of module
      _prototype[prop] = module[prop]
    afterInclude(module) if afterInclude

  @include = (args) ->
    _prototype = @prototype
    if args.constructor == Array && args[0].constructor == Object
      args.forEach (module) ->
        includeModule(module, _prototype)
    else if args.constructor == Object
      module = args
      includeModule(module, _prototype)
    else
      throw new Error('Arguments not an object or an array of objects')

module.exports = Base

