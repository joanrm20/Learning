'use strict';

angular.module('psJwtApp')
  .controller('RegisterCtrl', function ($scope,auth, alert) {
    $scope.submit = function () {

    auth.register($scope.email, $scope.password)
        .success(function (res) {
          alert('success', 'Account Created!', 'Welcome ' + res.user.email + ' !');
        })
        .error(function (err) {
          alert('warning', 'Opps!', 'Could not register');
        });
    };


  });