angular.module('Tracker')

.controller('ReportsController', function ($scope, WufooService) {

  WufooService.getAllForms().then( function (response) {
    $scope.reports = response.data;
  });


})


.controller('ReportsSingle', function ($scope, WufooService, $stateParams) {

  var user = $('#current-user').val();

  WufooService.getEntries($stateParams.formId, user).then( function (response) {
    console.log(response);
  });


})