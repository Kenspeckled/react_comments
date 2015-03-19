ActionHandler = require '../models/core/ActionHandler.coffee'
Comment = require '../models/Comment.coffee'

commentsActions = {
  commentSubmitted: (data) ->
    if !data || !data.comment
      throw new Error "No comment passed"
    c = Comment.create(data.comment)
    console.log c.save()
}

module.exports = commentsActions
