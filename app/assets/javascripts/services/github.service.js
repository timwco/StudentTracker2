angular.module('Tracker')

.service('GithubService', function ($http) {

  // Get All Issues for User
  this.getIssues = function (user) {
    return $http.get('github/issues/' + user);
  };

  // Get All Users for Org
  this.getUsersInOrg = function () {
    return $http.get();
  };



})
