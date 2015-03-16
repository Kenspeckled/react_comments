{div, form, input} = React.DOM

CommentForm = React.createClass(
  displayName: 'CommentForm',
  handleSubmit: (e) ->
    e.preventDefault()
    name = React.findDOMNode(@refs.name).value.trim()
    comment = React.findDOMNode(@refs.comment).value.trim()
    currentDate = new Date
    date = currentDate.toLocaleTimeString('en-gb', hour: '2-digit', minute: '2-digit') +  ", " + currentDate.toLocaleDateString('en-gb', day: 'numeric', month: 'short', year: 'numeric')
    #date = React.findDOMNode(@refs.date).value.trim()
    @props.onCommentSubmit({name: name, comment: comment, date: date})
    React.findDOMNode(@refs.name).value = ""
    React.findDOMNode(@refs.comment).value = ""
    React.findDOMNode(@refs.comment).focus()
  ,
  render: ->
    div className: "row",
      div className: "col-sm-12",
        form className: "commentForm", onSubmit: @handleSubmit,
          input type: "text", ref: "comment", placeholder: "Comment:",
          input type: "text", ref: "name", placeholder: "Your Name:",
          input type: "submit", value: "Post"
)

module.exports = CommentForm
