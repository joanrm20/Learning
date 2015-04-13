var singleton = (function() {
  var instance = undefined;

  function init() {
    //singleton

    var privateVariable = 'This is a private variable';
    var privateRandomNumber = Math.Random();

    function privateMethod() {
      console.log('This is a private method')
    }

    return {
      publicMethod: function() {
        console.log('This is public');
      },
      publicProperty: "This is also public",
      getRandomNumber: function() {
        return privateRandomNumber;
      }
    };

    return {
      getInstance: function() {
        if (!instance) {
          instance = init();
        }
        return instance;
      }
    }
  }
})();
