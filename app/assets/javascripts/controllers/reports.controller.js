angular.module('Tracker')

.controller('ReportsController', function ($scope, WufooService) {

  WufooService.getAllForms().then( function (response) {
    $scope.reports = response.data;
  });


})