'use strict';


angular.module('psJwtApp')
  .controller('LoginCtrl', function($scope, alert, $auth) {

    $scope.submit = function() {

      $auth.login({
          email: $scope.email,
          password: $scope.password
        })
        .then(function(res) {
          alert('success', 'Welcome!', 'thank for coming back ' + res.data.user.email + ' !');
        })
        .catch(handleError);
    };


    $scope.authenticate = function(provider) {

      $auth.authenticate(provider).then(function(res) {
        alert('success', 'Welcome!', 'thank for coming back ' + res.data.user.displayName + ' !');
      }).error(handleError);
    };


    function handleError(err) {
      alert('warning', 'something went wrong :(!', err.message);
    }

  });
