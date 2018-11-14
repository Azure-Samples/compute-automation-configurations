var express = require('express')
var app = express()
var os = require('os');
app.get('/', function (req, res) {
    res.send('Hello World from updated host ' + os.hostname() + '!')
})
app.listen(3000, function () {
    console.log('Hello world app listening on port 3000!')
})