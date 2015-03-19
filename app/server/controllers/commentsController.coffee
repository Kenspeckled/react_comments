Comment = require '../models/Comment.coffee'

commentsController = {

  getSomeResponse: (req, res) ->
    c = new Comment(name: "x", comment: "y", date: "1")
    c.save()
    res.send "poo"

}

module.exports = commentsController
