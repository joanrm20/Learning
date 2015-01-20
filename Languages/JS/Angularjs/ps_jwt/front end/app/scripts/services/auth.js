'use strict';


angular.module('psJwtApp')
  .service('auth', function auth($http, API_URL, authToken, $state) {

    function authSuccessful(res) {
      authToken.setToken(res.token);
      $state.go('main');
    }


    this.login = function (email, password) {
      return $http.post(API_URL + 'login', {
        email: email,
        password: password
      }).success(authSuccessful);
    }

    this.register = function (email, password) {
      return $http.post(API_URL + 'register', {
        email: email,
        password: password
      }).success(authSuccessful);
    }
  });