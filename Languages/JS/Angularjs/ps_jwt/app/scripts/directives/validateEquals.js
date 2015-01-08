'use strict';

angular.module('psJwtApp')
 .directive('matchValidator', function() {
    return {
      require: 'ngModel',
      link : function(scope, element, attrs, ngModel) {
        ngModel.$parsers.push(function(value) {
          ngModel.$setValidity('match', value === scope.$eval(attrs.matchValidator));
          return value;
        });
      }
    };
  })
  .directive('passwordCharactersValidator', function () {
    var PASSWORD_FORMATS = [
      /[^\w\s]+/, //special characters
      /[A-Z]+/, //uppercase letters
      /\w+/, //other letters
      /\d+/ //numbers
    ];

    return {
      require: 'ngModel',
      link: function (scope, element, attrs, ngModel) {
        ngModel.$parsers.push(function (value) {
          var status = true;
          angular.forEach(PASSWORD_FORMATS, function (regex) {
            status = status && regex.test(value);
          });
          ngModel.$setValidity('password-characters', status);
          return value;
        });
      }
    };
  });