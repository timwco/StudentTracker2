angular.module('Tracker')

.controller('ReportsController', function ($scope, WufooService) {

  WufooService.getAllForms().then( function (response) {
    $scope.reports = response.data;
  });


})


.controller('ReportsSingle', function ($scope, WufooService, $stateParams) {

  var user = $('#current-user').val();
  var userName = $('#current-user-name').val();

  $scope.title = $stateParams.formId;

  WufooService.getAllFields($stateParams.formId).then( function (response) {
    // Set Array of Fields
    var fields = response.data;
    
    WufooService.getEntries($stateParams.formId, user).then( function (response) {

      // Check for Errors
      if (response.data.error) { return $scope.error = response.data.error; }

      // Get Specific User from Array
      var report = _.filter(response.data, function (y) {
        return _.contains(_.values(y), userName + ' - ' + user);
      });

      // Map a new array of objects with right field name and correct entry
      var final = [];
      _.each(fields, function (field) {
        var obj = {
          field: field.Title,
          response: report[0][field.ID]
        };
        final.push(obj);
      });
      $scope.entries = final;
    });

  });

})