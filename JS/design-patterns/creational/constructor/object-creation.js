// Each of the following will create a new empty object


// Better to use the literal sintax object creation.
var newObject = {};

//or
var newObject = Object.create(Object.prototype);

//or

var newObject = new Object();

// -- Dot syntax

newObject.myKey = "Hey!!";

// Get
var value = newObject.myKey;

// -- Square brackets syntax
newObject['myKey'] = "Hi";
//Get
var value = newObject['myKey'];

// --Object define properties
var defineProp = function(obj, key, value) {
  var config = {
    value: value,
    writable: true,
    enumerable: true,
    configurable: true
  };
  Object.defineProperty(obj, key, config);
};
// use
var person = Object.create(Object.prototype);
defineProp(person, 'car', 'Delorean');


Object.defineProperties(newObject, {
  "newKey": {
    value: "hey",
    writable: true
  },
  "anotherNewKey": {
    value: 'test'
    writable: false
  }
});
