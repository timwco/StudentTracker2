angular.module('Tracker')

.service('GithubService', function ($http) {

  // Get All Issues for User
  this.getIssues = function (user) {
    return $http.get('github/issues/' + user);
  };

  // Get All Users for Org
  this.getUsersInOrg = function () {
    return $http({
      url: 'github/org-members',
      method: 'get',
      cache: true
    });
  };

  // Get Specific User Info
  this.getUserInfo = function (username) {
    return $http({
      url: '/github/user/' + username,
      method: 'get',
      cache: true
    })
  };


})
