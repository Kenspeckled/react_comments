Comment = require('../../app/models/comments/comment.coffee')

describe "Comment", ->
  it "should define a list of comments on construction", ->
    comment = new Comment()
    expect comment.comments.length
      .toBeGreaterThan 1

  it "should have property a mixed in", ->
    comment = new Comment()
    expect comment.a
      .toEqual 5

  it "should have property b mixed in", ->
    comment = new Comment()
    expect comment.b
      .toEqual 8
