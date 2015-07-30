Inelec
  /**
   * Client edition controller
   * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
   */
  .controller(
    'ClientEditCtrl',
    [
      '$scope',
      '$stateParams',
      'Restangular',
      '$state',
      function(
        $scope,
        $stateParams,
        Restangular,
        $state
      ) {
        'use strict';

        $scope.RestangularClient = Restangular.one('clients', $stateParams.id);

        // Set client
        $scope.RestangularClient.get().then(function (client) {
          $scope.client = client;
        });

        /**
         * Updates a client
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.submit = function (client) {
          $scope.$parent.updateClient(client).then(function () {
            // Refresh view
            $scope.getClients();
            $state.transitionTo('clients.list');
          }, function () {

          });
        };
      }
    ]
  );