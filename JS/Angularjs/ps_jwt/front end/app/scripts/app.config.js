(function() {
  'use strict';

  angular
    .module('psJwtApp').config(function($urlRouterProvider, $stateProvider, $httpProvider, $authProvider, API_URL) {

      $urlRouterProvider.otherwise('/');
      $stateProvider
        .state('main', {
          url: '/',
          templateUrl: '/views/main.html'
        })
        .state('jobs', {
          url: '/jobs',
          templateUrl: '/views/jobs.html',
          controller: 'JobsCtrl'
        })
        .state('register', {
          url: '/register',
          templateUrl: '/views/register.html',
          controller: 'RegisterCtrl'
        })
        .state('login', {
          url: '/login',
          templateUrl: '/views/login.html',
          controller: 'LoginCtrl'
        })
        .state('logout', {
          url: '/logout',
          controller: 'LogoutCtrl'
        });
      $authProvider.loginUrl = API_URL + 'login';
      $authProvider.signupUrl = API_URL + 'register';
      $authProvider.google({
        clientId: '1034438962109-58nv5vn1e993a6tjh2sfqeu06t04sup4.apps.googleusercontent.com',
        url: API_URL + 'auth/google'
      });

      $authProvider.facebook({
        clientId:'1534033043529646',
        url: '/auth/facebook',
        authorizationEndpoint: 'https://www.facebook.com/dialog/oauth',
        redirectUri: window.location.origin || window.location.protocol + '//' + window.location.host + '/',
        scope: 'email',
        scopeDelimiter: ',',
        requiredUrlParams: ['display', 'scope'],
        display: 'popup',
        type: '2.0',
        popupOptions: {
          width: 481,
          height: 269
        }
      });

      $httpProvider.interceptors.push('authInterceptor');
    })
    .constant('API_URL', 'http://localhost:3000/')
    .run(function($window) {
      var params = $window.location.search.substring(1);
      if (params && $window.opener && $window.opener.location.origin === $window.location.origin) {
        var pair = params.split('=');
        var code = decodeURIComponent(pair[1]);
        $window.opener.postMessage(code, $window.location.origin);

      }
      console.log(params);
    })

}());
