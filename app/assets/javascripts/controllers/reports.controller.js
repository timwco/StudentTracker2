angular.module('Tracker')

.controller('ReportsController', function ($scope, WufooService) {

  WufooService.getAllForms().then( function (response) {
    $scope.reports = response.data;
  });


})


.controller('ReportsSingle', function ($scope, WufooService, $stateParams) {

  var user = $('#current-user').val();

  $scope.title = $stateParams.formId;

  WufooService.getAllFields($stateParams.formId).then( function (response) {
    console.log(response);
    
    WufooService.getEntries($stateParams.formId, user).then( function (response) {
      if (response.data.error) { return $scope.error = response.data.error; }
      $scope.entries = response.data;
      console.log(response.data);
    });

  });

})