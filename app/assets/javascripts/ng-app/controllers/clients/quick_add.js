Inelec
  /**
   * Quick add controller
   * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
   */
  .controller('ClientQuickAddCtrl', ['$scope', function ($scope) {
    'use strict';

    /**
     * Adds a new client using the quick add form
     * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
     */
    $scope.submit = function (client) {
      $scope.$parent.addClient(client).then(function () {
        // Clear form
        $scope.client = {};
        $scope.quick_add_user_form.$setPristine();
        $scope.quick_add_user_form.$setUntouched();
        // Refresh view
        $scope.getClients();
      }, function () {

      });
    };
  }]);