angular.module('Tracker')

.service('WufooService', function ($http) {


  this.getAllForms = function () {
    return $http({
      url: '/wufoo/forms',
      method: 'get',
      cache: true
    });
  };

  this.getEntries = function (formId, user) {
    return $http({
      url: '/wufoo/entries/' + formId,
      params: {
        user: user
      },
      method: 'get',
      cache: true
    });
  };


})
