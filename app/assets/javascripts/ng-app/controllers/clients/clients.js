Inelec
  /**
   * Main clients controller
   * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
   */
  .controller(
    'ClientsCtrl',
    [
      '$scope',
      '$filter',
      'Restangular',
      'paginatedList',
      function(
        $scope,
        $filter,
        Restangular,
        paginatedList
      ) {
        'use strict';

        var
          orderBy = $filter( 'orderBy' ),
          filter = $filter( 'filter' );

        $scope.RestangularClients = Restangular.all( 'clients' );
        $scope.RestangularClientCategories = Restangular.all( 'clients/categories' );

        /**
         * Initializes controller
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.init = function() {
          // Create pagination service for clients list
          $scope.pagination = paginatedList();
          $scope.pagination.itemsPerPage = 50;

          // Get client categories
          $scope.RestangularClientCategories.getList().then( function( categories ) {
            $scope.client_categories = categories;
          } );

          // Get clients
          $scope.getClients();

          // Watch query field in order to filter results
          $scope.$watch( 'query', function( newValue, oldValue ) {
            $scope.order( $scope.predicate, $scope.reverse );
          } );
        };

        /**
         * Orders the list using the supplied parameter and direction
         * @param  {string} predicate Predicate
         * @param  {boolean} reverse   Reserve or not
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.order = function( predicate, reverse ) {
          $scope.pagination.setItems(
            orderBy(
              filter(
                $scope.clients,
                $scope.query
              ),
            predicate,
            reverse
          ));
        };

        /**
         * Adds a new client
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.addClient = function( client ) {
          return $scope.RestangularClients.post( { client: client } );
        };

        /**
         * Updates an existing client
         * @param  {Object} client Client object
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.updateClient = function( client ) {
          return client.put();
        };

        /**
         * Gets all clients
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.getClients = function() {
          $scope.RestangularClients.getList().then( function( clients ) {
            $scope.clients = clients;
            $scope.order( 'name', false );
          } );
        };

        // Initialize controller
        $scope.init();
      }
    ]
  );
