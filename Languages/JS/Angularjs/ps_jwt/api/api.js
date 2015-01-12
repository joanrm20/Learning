var express = require('express');
var bodyParser = require('body-parser');
var app = express();
var mongoose = require('mongoose');
var User = require('./models/User.js');


app.use(bodyParser.json());

app.use(function (req, res, next) {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
  res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  
  next();
});


app.post('/register', function (req, res) {
  var user= req.body;

  var newUser = new User.model({
      email: user.email,
      password:user.password
  });
  
  newUser.save(function(err){
   res.status(200).send(newUser.toJSON());
  });
});

mongoose.connect('mongodb://node_api_tut:node_api_tut@ds063150.mongolab.com:63150/node_api_tut');

var server = app.listen(3000, function () {

  console.log('api listening on ', server.address().port);

});