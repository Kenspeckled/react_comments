ActionController = require '../../models/actionController.coffee'
Comment = require '../../models/comments/comment.coffee'

commentsControllerActions = {
  commentSubmitted: (data) ->
    throw new Error "No comment passed" if !data.comment
    Comment.create(data.comment)
}

module.exports = commentsControllerActions
