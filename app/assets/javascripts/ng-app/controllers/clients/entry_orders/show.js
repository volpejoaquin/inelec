Inelec
  /**
   * Entry order show controller
   * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
   */
  .controller(
    'EntryOrderShowCtrl',
    [
      '$scope',
      '$stateParams',
      'Restangular',
      'paginatedList',
      function(
        $scope,
        $stateParams,
        Restangular,
        paginatedList
      ) {
        'use strict';

        /**
         * Initializes controller
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.init = function() {
          // Get client data
          $scope.getClient();
        };

        /**
         * Gets the data corresponding to the current user
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.getClient = function() {
          $scope.RestangularClient.get().then( function( client ) {
            $scope.client = client;
            $scope.entry_orders = client.entry_orders;
          } );
        };

        // Initialize controller
        $scope.init();
      }
    ]
  );
