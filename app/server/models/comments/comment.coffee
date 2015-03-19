# Modified class for server use
Comment = require '../../../client/models/comments/comment.coffee'

Comment.extend {
  someMethod: ->
    console.log "###### HI ######"
}

module.exports = Comment
