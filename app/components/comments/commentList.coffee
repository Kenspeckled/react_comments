CommentBox = require './commentBox.coffee'
CommentForm = require './commentForm.coffee'
Comment = require '../../models/comments/comment.coffee'
{div} = React.DOM


CommentList = React.createClass(
  componentDidMount: ->
    Comment.listen 'change', =>
       @forceUpdate()

  handleCommentSubmit: (comment) ->
    Comment.create(comment)

  displayName: 'CommentList',
  render: ->
    div null,
      for comment in Comment.all()
        React.createElement(CommentBox, comment: comment)
      React.createElement(CommentForm, onCommentSubmit: @handleCommentSubmit)
)
module.exports = CommentList
