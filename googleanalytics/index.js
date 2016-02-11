var express = require('express');
var app = express();

app.get('/', function(req,res) {
  res.redirect('/ui');
})
app.get('/id', function(req,res) {
  res.send(process.env.TRACKING_ID).end();
})

// Static file server on the 'ui' directory
app.use('/ui', express.static('ui'));

var server = app.listen(8080, function () {
    var host = server.address().address;
    var port = server.address().port;

    console.log('Example app listening at http://%s:%s', host, port);
});