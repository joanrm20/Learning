'use strict';

describe('Directive: sameAs', function () {

  // load the directive's module
  beforeEach(module('psJwtApp'));

  var element,
    scope;

  beforeEach(inject(function ($rootScope) {
    scope = $rootScope.$new();
  }));

  it('should make hidden element visible', inject(function ($compile) {
    element = angular.element('<same-as></same-as>');
    element = $compile(element)(scope);
    expect(element.text()).toBe('this is the sameAs directive');
  }));
});
