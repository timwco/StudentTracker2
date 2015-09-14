//= require angular/angular

console.log('hello');

angular.module('Tracker', [])

.controller('HomeController', function ($scope, $http) {

  $http.get('students').then( function (res) {
    $scope.students = res.data;
  });

});
