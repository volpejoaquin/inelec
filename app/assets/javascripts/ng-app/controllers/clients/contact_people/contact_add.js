Inelec
  /**
   * Add contact people controller
   * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
   */
  .controller(
    'ContactAddCtrl',
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
        $scope.contact = {
          name: 'Juan Gomez',
          email: 'juan.gomez@yahoo.com.ar',
          phone: '29146559',
          position: 'Gerente',
          decision_maker: true
        };

        /**
         * Initializes controller
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.init = function() {
        };

        /**
         * Saves a new or existing contact
         * @param  {object} contact Contact object
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        $scope.saveContact = function(contact) {
          console.log($scope.client.contact_people);
          // Create new contact
          $scope.client.post('contact_people', {contact_person: contact}).then(function() {
            // Clear form
            $scope.contact = {};
            $scope.add_contact_form.$setPristine();
            $scope.add_contact_form.$setUntouched();
            // Refresh view
            $scope.getClient();
          });
        };

        // Initialize controller
        $scope.init();
      }
    ]
  );