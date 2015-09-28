angular.module('Tracker')

.controller('UserController', function ($scope, $http, GithubService) {

  // Bootstrap the Current User & Admin
  $scope.currentUser = $('#current-user').val();
  $scope.isAdmin = $('#current-user-admin').val();

  // Get Issues
  GithubService.getIssues($scope.currentUser).then( function (res) {

    // Sort and Bind Issues
    $scope.issues = _.sortBy(res.data, 'state').reverse();

    // Get Repo Count and complete/incomplete
    $scope.complete = 0,
    $scope.total = $scope.issues.length;
    _.each($scope.issues, function(issue){
        $scope.complete += (issue.state === 'closed') ? 1 : 0;
    });
    $scope.incomplete = $scope.total - $scope.complete;

    // Get Percentage
    var percentClosed = Math.floor(($scope.complete / $scope.total) * 100);
    if (percentClosed > 80) {
      $scope.status = 'Based on your current status, you will be graduating on time.';
      $scope.icon = 'fa-check-circle';
      $scope.color = 'green';
    } else {
      $scope.status = 'Based on your current status, in order to graduate on time, you need to close a few more assignments, and prove that you understand the material. You should meet with your instructor to come up with a plan to complete your missing work.';
      $scope.icon = 'fa-exclamation-triangle';
      $scope.color = 'red';
    }


  })

})