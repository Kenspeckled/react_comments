Comment = require '../models/comments/comment.coffee'

commentsServerActions = {
  commentSubmitted: (data) ->
    Comment.someMethod()
  hello: ->
    'poo'
}

module.exports = commentsServerActions
