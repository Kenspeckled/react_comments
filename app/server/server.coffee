# Allow better relative routes with explicit context
path = require 'path'
global.rootRequire = (name) ->
  require path.normalize(__dirname + '/../' + name)

commentsController = rootRequire 'server/controllers/commentsController.coffee'

express = require("express")
server = express()


server.use express.static('public')

server.post '/create', commentsController.getSomeResponse


server = server.listen 8000, ->
  host = server.address().address
  port = server.address().port
  console.log "App listening at http://%s:%s", host, port
