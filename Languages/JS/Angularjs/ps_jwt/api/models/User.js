//Use bcrypt to encrypt our password
var bcrypt = require('bcrypt-nodejs');
var mongoose = require('mongoose');

var UserSchema = new mongoose.Schema({
  email: String,
  password: String
});


//Delete password field from response(security)
UserSchema.methods.toJSON = function () {
  var user = this.toObject();
  delete user.password;

  return user;
}


exports.model = mongoose.model('User', UserSchema);

UserSchema.pre('save', function (next) {
  var user = this;

  if (!user.isModified('password')) return next();

  bcrypt.genSalt(10, function (err, salt) {
    if (err) return next(err);


    bcrypt.hash(user.password, salt, null, function (err, hash) {
      if (err) return next(err);

      user.password = hash;
      next();
    })
  });
})