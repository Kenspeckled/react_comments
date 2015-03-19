CommentBox = require './commentBox.coffee'
CommentForm = require './commentForm.coffee'
Comment = require '../../models/Comment.coffee'
ActionHandler = require '../../models/core/ActionHandler.coffee'
{div} = React.DOM


CommentList = React.createClass(
  componentDidMount: ->
    Comment.listen 'changed', =>
       @forceUpdate()

  handleCommentSubmit: (comment) ->
    ActionHandler.broadcast('commentSubmitted', {comment: comment})

  displayName: 'CommentList',
  render: ->
    div null,
      for comment in Comment.all()
        React.createElement(CommentBox, comment: comment)
      React.createElement(CommentForm, onCommentSubmit: @handleCommentSubmit)
)
module.exports = CommentList
