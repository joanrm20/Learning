'use strict';

/**
 * @ngdoc function
 * @name psJwtApp.controller:RegisterCtrl
 * @description
 * # RegisterCtrl
 * Controller of the psJwtApp
 */
angular.module('psJwtApp')
  .controller('RegisterCtrl', function ($scope, $http,alert) {
    var url ='/',
        user={};
    $scope.submit = function(){
      $http.post(url,user)
      .success(function(){
         alert('success','ok!', 'You are now registered');
      })
      .error(function(){
        alert('warning','Opps!', 'Could not register');
      });
    };


  });