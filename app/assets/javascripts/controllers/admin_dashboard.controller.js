angular.module('Tracker')

.controller('AdminController', function ($scope, GithubService) {


  GithubService.getUsersInOrg().then( function (response) {
    console.log(response);
    $scope.members = response.data;
  });

})