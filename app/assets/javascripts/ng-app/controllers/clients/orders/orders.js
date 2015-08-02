Inelec
  /**
   * Main contact orders controller
   * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
   */
  .controller(
    'OrdersCtrl',
    [
      '$scope',
      '$filter',
      '$stateParams',
      'Restangular',
      'paginatedList',
      function(
        $scope,
        $filter,
        $stateParams,
        Restangular,
        paginatedList
      ) {
        'use strict';

        var orderBy = $filter('orderBy');

         /**
         * Initializes controller
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.init = function () {
          // Create pagination service for contacts list
          $scope.pagination = paginatedList();

          // Get contact people
          $scope.getContacts();
        };

        /**
         * Orders the list using the supplied parameter and direction
         * @param  {string} predicate Predicate
         * @param  {boolean} reverse   Reserve or not
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.order = function (predicate, reverse) {
          $scope.pagination.setItems(orderBy($scope.contacts, predicate, reverse));
        };

         /**
         * Gets all contact people and refreshes view
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.getContacts = function () {
          $scope.RestangularClient.getList('contact_people').then(function(contacts) {
            $scope.contacts = contacts;
            $scope.order('name', false);
          });
        };

        // Initialize controller
        $scope.init();
      }
    ]
  );