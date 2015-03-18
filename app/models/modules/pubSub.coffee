pubSub = {
  publish: (ev, args...) ->
    _callbackList = @_callbacks[ev]
    return this if !@hasOwnProperty(_callbacks) || !_callbackList
    _callbackList.forEach (fn) =>
      fn.apply(this, args...)
    return this

  subscribe: (ev, fn) ->
    @_callbacks = {} if !@hasOwnProperty(_callbacks)
    (@_callbacks[ev] || @_callbacks[ev] = []).push fn
    return this
}
module.exports = pubSub
