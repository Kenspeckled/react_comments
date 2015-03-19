Comment = require '../models/comments/comment.coffee'

commentsServerActions = {

  getSomeResponse: ->
    c = new Comment(name: "x", comment: "y", date: "1")
    c.save()

}

module.exports = commentsServerActions
