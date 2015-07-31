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
            $scope.contactsPagination = paginatedList( client.contacts );
          } );
        };

        /**
         * Adds a new contact to the client
         * @param  {Object} contact Contact object
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.addContact = function( contact ) {
          $scope.client.post( 'add_contact', { contact: contact } ).then( function() {
            // Reset form
            $scope.contact = {};
            $scope.add_contact_form.$setPristine();
            $scope.add_contact_form.$setUntouched();
            // Refresh client info
            $scope.getClient();
          } );
        };

        // Initialize controller
        $scope.init();
      }
    ]
  );
