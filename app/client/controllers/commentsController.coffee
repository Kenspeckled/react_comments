ActionController = require '../models/actionController.coffee'
Comment = require '../models/comments/comment.coffee'

commentsControllerActions = {
  commentSubmitted: (data) ->
    if !data || !data.comment
      throw new Error "No comment passed" 
    c = Comment.create(data.comment)
    console.log c.save()
}

module.exports = commentsControllerActions
