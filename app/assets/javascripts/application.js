//= require angular/angular

angular.module('Tracker', [])


.controller('HomeController', function ($scope, $http) {

  // $http.get('students').then( function (res) {
  //   $scope.students = res.data;
  // });

  $http.get('github/user').then( function (res) {
    console.log(res);
  });

  $http.get('github/repos').then( function (res) {
    console.log(res);
  });

});
