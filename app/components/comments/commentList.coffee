CommentBox = require './commentBox.coffee'
CommentForm = require './commentForm.coffee'
Comment = require '../../models/comments/comment.coffee'
{div} = React.DOM

#Temporary
c = new Comment()
comments = c.comments

CommentList = React.createClass(
  getInitialState: ->
    comments: comments
  handleCommentSubmit: (comment) ->
    comments.push comment
    @setState {comments: comments}

  displayName: 'CommentList',
  render: ->
    div null,
      for comment, index in @state.comments 
        React.createElement(CommentBox, {comment: comment, index: index})
      React.createElement(CommentForm, onCommentSubmit: @handleCommentSubmit)
)
module.exports = CommentList
