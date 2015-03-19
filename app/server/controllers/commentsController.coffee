Comment = rootRequire 'server/models/Comment.coffee'

commentsController = {

  getSomeResponse: (req, res) ->
    c = new Comment(name: "x", comment: "y", date: "1")
    response = c.save()
    res.send response

}

module.exports = commentsController
