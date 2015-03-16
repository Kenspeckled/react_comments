CommentList = require('./app/components/comments/commentList.coffee')

React.render(
  React.createElement(CommentList, null),
  document.getElementById('content')
)

