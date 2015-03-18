CommentList = require('./components/comments/commentList.coffee')
registerControllers = require('./controllers/controllerRegistry.coffee')

registerControllers()

React.render(
  React.createElement(CommentList, null),
  document.getElementById('content')
)

