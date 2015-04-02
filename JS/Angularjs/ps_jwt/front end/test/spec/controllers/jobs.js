'use strict';

describe('Controller: JobsCtrl', function () {

  // load the controller's module
  beforeEach(module('psJwtApp'));

  var JobsCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    JobsCtrl = $controller('JobsCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.awesomeThings.length).toBe(3);
  });
});
