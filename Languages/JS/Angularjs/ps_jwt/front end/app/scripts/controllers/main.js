(function () {
	'use strict';

	/**
	 * @ngdoc function
	 * @name psJwtApp.controller:MainCtrl
	 * @description
	 * # MainCtrl
	 * Controller of the psJwtApp
	 */
	angular.module('psJwtApp')
		.controller('MainCtrl', function ($scope) {
			$scope.awesomeThings = [
        'HTML5 Boilerplate',
        'AngularJS',
        'Karma'
      ];
		});
}());