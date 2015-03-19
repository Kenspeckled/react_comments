# Modified class for server use
Comment = require '../../client/models/Comment.coffee'

Comment.extend {
  save: ->
    console.log "Save"

  someMethod: ->
    console.log "###### HI ######"
}

Comment.include {
  save: ->
    "New Server Save"
}

module.exports = Comment
