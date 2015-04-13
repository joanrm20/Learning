function Car(model) {
  this.model = model;
  this.color = "blue";
  this.year = "2015";

  this.getInfo = function() {
    return this.model + ' ' + this.year;
  }
}

// Implementation

var newCar = new Car('BMW');

newCar.year = 2016;

console.log(newCar.getInfo());


