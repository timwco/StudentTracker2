angular.module('Tracker')

.service('WufooService', function ($http) {


  this.getAllForms = function () {
    return $http({
      url: '/wufoo/forms',
      method: 'get',
      cache: true
    });
  }


})
