# Modified class for server use
Comment = require '../../../client/models/comments/comment.coffee'

Comment.extend {
  save: ->
    console.log "Save"

  someMethod: ->
    console.log "###### HI ######"

}
Comment.prototype.save = ->
  "New Server Save"

module.exports = Comment
