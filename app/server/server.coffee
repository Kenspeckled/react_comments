express = require("express")
server = express()

commentsServerActions = require './controllers/commentsServerSideController.coffee'

server.use express.static('public')

server.get '/create', commentsServerActions.getSomeResponse

server = server.listen 8000, ->
  host = server.address().address
  port = server.address().port
  console.log "App listening at http://%s:%s", host, port
