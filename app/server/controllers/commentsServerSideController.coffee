Comment = require '../models/comments/comment.coffee'

commentsServerActions = {

  getSomeResponse: ->
    Comment.someMethod()
    'poo'

}

module.exports = commentsServerActions
