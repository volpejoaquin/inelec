Inelec
  /**
   * Main entry orders controller
   * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
   */
  .controller(
    'EntryOrdersCtrl',
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
          // Create pagination service for orders list
          $scope.pagination = paginatedList();

          // Get orders people
          $scope.getOrders();
        };

        /**
         * Orders the list using the supplied parameter and direction
         * @param  {string} predicate Predicate
         * @param  {boolean} reverse   Reserve or not
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.order = function (predicate, reverse) {
          $scope.pagination.setItems(orderBy($scope.orders, predicate, reverse));
        };

         /**
         * Gets all orders refreshes view
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.getOrders = function () {
          $scope.RestangularClient.getList('entry_orders').then(function(orders) {
            $scope.orders = orders;
            $scope.order('number', false);
          });
        };

        // Initialize controller
        $scope.init();
      }
    ]
  );