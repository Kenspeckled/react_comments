commentsController = require './controllers/commentsController.coffee'

express = require("express")
server = express()


server.use express.static('public')

server.get '/create', commentsController.getSomeResponse


server = server.listen 8000, ->
  host = server.address().address
  port = server.address().port
  console.log "App listening at http://%s:%s", host, port
