Comment = require('../../app/models/comments/comment.coffee')

describe "Comment", ->
  it "should define a list of comments on construction", ->
    comment = new Comment()
    expect comment.comments.length
      .toBeGreaterThan 1
