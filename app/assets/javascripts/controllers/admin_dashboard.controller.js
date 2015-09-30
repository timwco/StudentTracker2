angular.module('Tracker')

.controller('AdminController', function ($scope, GithubService) {

  GithubService.getUsersInOrg().then( function (response) {
    console.log(response);
    $scope.members = response.data;
  });

  $scope.getStudentInfo = function (username) {
    GithubService.getUserInfo(username).then( function (response) {
      $scope.student = response.data;
    });
  };

})