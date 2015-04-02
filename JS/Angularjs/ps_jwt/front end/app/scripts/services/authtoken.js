'use strict';

angular.module('psJwtApp')
  .factory('authToken', function ($window) {
    //cached token allow us to have the token in memory, just as
    // little optimization to not access the token that is save on local storage.
    var storage = $window.localStorage,
      cachedToken, userToken = 'userToken';
    // Public API here
    var authToken = {
      setToken: function (token) {
        cachedToken = token;
        storage.setItem(userToken, token);
      },
      getToken: function () {
        if (!cachedToken) {
          cachedToken = storage.getItem(userToken);
        }

        return cachedToken;
      },
      isAuthenticated: function () {
        return !!authToken.getToken();
      },
      removeToken: function () {
        cachedToken = null;
        storage.removeItem(userToken);
      }

    };

    return authToken;
  });