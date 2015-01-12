'use strict';

/**
 * @ngdoc function
 * @name psJwtApp.controller:RegisterCtrl
 * @description
 * # RegisterCtrl
 * Controller of the psJwtApp
 */
angular.module('psJwtApp')
  .controller('RegisterCtrl', function ($scope, $http, alert) {


    $scope.submit = function () {
      var url = 'http://localhost:3000/register',
        user = {
          email: $scope.email,
          password: $scope.password
        };

      console.log(user);
      $http.post(url, user)
        .success(function (res) {
          alert('success', 'ok!', 'You are now registered');
        })
        .error(function (err) {
          alert('warning', 'Opps!', 'Could not register');
        });
    };


  });