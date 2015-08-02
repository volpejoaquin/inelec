Inelec
  /**
   * Client show controller
   * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
   */
  .controller(
    'ClientShowCtrl',
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

        $scope.RestangularClient = Restangular.one( 'clients', $stateParams.id );

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
            // Paginate contacts
            $scope.contactPeoplePagination = paginatedList( client.contact_people );
            console.log($scope.contactPeoplePagination);
          } );
        };

        // Initialize controller
        $scope.init();
      }
    ]
  );
