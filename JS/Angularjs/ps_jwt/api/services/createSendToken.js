var jwt = require('jwt-simple');
var moment = require('moment');
module.exports = function(user, res) {

  var payload = {
    sub: user._id,
    exp: moment().add(10, 'days').unix()
  };
  //payload and secret temporary key
  var token = jwt.encode(payload, 'shh..');

  res.status(200).send({
    user: user.toJSON(),
    token: token
  });
}
