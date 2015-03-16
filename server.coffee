express = require("express")
app = express()

app.get('/', (req, res) ->
  res.send "hello world!"
)

server = app.listen(3000, ->
  host = server.address().address
  port = server.address().port

  console.log "App listening at http://%s:%s", host, port

)