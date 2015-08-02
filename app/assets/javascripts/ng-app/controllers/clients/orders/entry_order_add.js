Inelec
  /**
   * Add entry order controller
   * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
   */
  .controller(
    'EntryOrderAddCtrl',
    [
      '$scope',
      '$stateParams',
      'Restangular',
      function(
        $scope,
        $stateParams,
        Restangular
      ) {
        'use strict';

        // Remove this
        $scope.order = {
          number: '1',
          datetime: new Date().toString(),
          comments: 'Comment'
        };

        /**
         * Initializes controller
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.init = function() {
        };

        /**
         * Saves a new or existing entry order
         * @param  {object} order Order
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.saveOrder = function(order) {
          // Create new order
          $scope.orders.post({entry_order: order}).then(function() {
            // Clear form
            $scope.entry_order = {};
            $scope.add_entry_order_form.$setPristine();
            $scope.add_entry_order_form.$setUntouched();
            // Refresh view
            $scope.getOrders();
          });
        };

        // Initialize controller
        $scope.init();
      }
    ]
  );