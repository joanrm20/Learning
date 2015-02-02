'use strict';

angular.module('psJwtApp')
  .controller('HeaderCtrl', function ($scope,$auth) {
    $scope.isAuthenticated = $auth.isAuthenticated;
  });
