CommentBox = require './commentBox.coffee'
CommentForm = require './commentForm.coffee'
Comment = require '../../models/comments/comment.coffee'
ActionController = require '../../models/actionController.coffee'
{div} = React.DOM


CommentList = React.createClass(
  componentDidMount: ->
    Comment.listen 'changed', =>
       @forceUpdate()

  handleCommentSubmit: (comment) ->
    ActionController.broadcast('commentSubmitted', {comment: comment})

  displayName: 'CommentList',
  render: ->
    div null,
      for comment in Comment.all()
        React.createElement(CommentBox, comment: comment)
      React.createElement(CommentForm, onCommentSubmit: @handleCommentSubmit)
)
module.exports = CommentList
