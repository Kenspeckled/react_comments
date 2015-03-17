class Base

  @include = (args...) ->
    _prototype = @prototype
    args.forEach (module) ->
      if module.constructor != Object
        throw new Error('Arguments not an object or an array of objects')
      afterInclude = _prototype.afterInclude 
      for prop of module
        _prototype[prop] = module[prop]
      afterInclude(module) if afterInclude

module.exports = Base

