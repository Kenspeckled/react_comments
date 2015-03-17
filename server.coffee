express = require("express")
app = express()

app.use express.static('public')

server = app.listen(8000, ->
  host = server.address().address
  port = server.address().port

  console.log "App listening at http://%s:%s", host, port

)
