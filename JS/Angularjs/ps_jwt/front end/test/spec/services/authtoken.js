'use strict';

describe('Service: authToken', function () {

  // load the service's module
  beforeEach(module('psJwtApp'));

  // instantiate service
  var authToken;
  beforeEach(inject(function (_authToken_) {
    authToken = _authToken_;
  }));

  it('should do something', function () {
    expect(!!authToken).toBe(true);
  });

});
