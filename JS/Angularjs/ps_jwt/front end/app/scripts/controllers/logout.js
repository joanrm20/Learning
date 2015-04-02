'use strict';


angular.module('psJwtApp')
  .controller('LogoutCtrl', function ($state, $auth) {
    $auth.logout();
    $state.go('main');
  });
