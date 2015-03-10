{section, article, img, a, p, ul, li, div, h1, input} = React.DOM
CommentForm = React.createClass(
  displayName: 'CommentForm',
  render: ->
    div className: "row",
      div className: "col-sm-12",
        div className: "comment-input",
          input type: "text", name: "comment", "Comment:"

)
React.render(
  React.createElement(CommentForm, null),
  document.getElementById('content')
)
