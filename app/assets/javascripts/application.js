//= require angular/angular
//= require satellizer/satellizer

angular.module('Tracker', ['satellizer'])

.config(function($authProvider) {

    $authProvider.github({
      clientId: '377bc8c648ebb1e04cad'
    });

  })

.controller('HomeController', function ($scope, $http, $auth) {

  $http.get('students').then( function (res) {
    $scope.students = res.data;
  });

  $scope.authenticate = function(provider) {
    $auth.authenticate(provider)
    .then(function(response) {
      console.log('Success: ', response);
    })
    .catch(function(response) {
      console.log('Error: ', response);
    });
  };

});
