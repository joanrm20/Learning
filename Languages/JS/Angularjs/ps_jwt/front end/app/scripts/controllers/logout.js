'use strict';


angular.module('psJwtApp')
  .controller('LogoutCtrl', function ($state, authToken) {
    authToken.removeToken();
    $state.go('main');
  });