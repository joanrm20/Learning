'use strict';


angular.module('psJwtApp')
  .controller('LoginCtrl', function ($scope, alert, auth) {

    $scope.submit = function () {

      auth.login($scope.email, $scope.password)
        .success(function (res) {
          alert('success', 'Welcome!', 'thank for coming back ' + res.user.email + ' !');
        })
        .error(function (err) {
          alert('warning', 'something went wrong :(!', err.message);
        });
    };

  });