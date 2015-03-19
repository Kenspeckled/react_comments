require('./actions/actionRegistry.coffee')() #registerActions
CommentList = require('./components/comments/commentList.coffee')


React.render(
  React.createElement(CommentList, null),
  document.getElementById('content')
)

