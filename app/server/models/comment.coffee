# Modified class for server use
Comment = rootRequire 'client/models/Comment.coffee'

Comment.extend {
  someClassMethod: ->
    console.log "Save"
}

Comment.include {
  save: ->
    console.log "###### HI ######"
    "New Server Save"
}

module.exports = Comment
