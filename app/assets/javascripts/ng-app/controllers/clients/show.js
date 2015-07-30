Inelec
  /**
   * Client show controller
   * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
   */
  .controller('ClientShowCtrl', ['$scope', '$stateParams', 'Restangular', 'paginatedList', function ($scope, $stateParams, Restangular, paginatedList) {
    'use strict';

    $scope.RestangularClient = Restangular.one('clients', $stateParams.id);

    /**
     * Initializes controller
     * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
     */
    $scope.init = function () {
      // Get client data
      $scope.getClient();
    };

    /**
     * Gets the data corresponding to the current user
     * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
     */
    $scope.getClient = function () {
      $scope.RestangularClient.get().then(function (client) {
        $scope.client = client;
        // Paginate members
        $scope.membersPagination = paginatedList(client.members);
        // Paginate companies
        $scope.companiesPagination = paginatedList(client.companies);
      });
    };

    /**
     * Adds a new member to the client
     * @param  {Object} member Member object
     * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
     */
    $scope.addMember = function (member) {
      $scope.client.post('add_member', { member: member }).then(function () {
        // Reset form
        $scope.member = {};
        $scope.add_member_form.$setPristine();
        $scope.add_member_form.$setUntouched();
        // Refresh client info
        $scope.getClient();
      });
    };

    /**
     * Toggles has the system for the current member
     * @param  {object} member Member to be updated
     * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
     */
    $scope.setHasTheSystemForMember = function (member) {
      if (confirm("Are you sure you want to toggle the value for the current member?")) {
        $scope.RestangularClient.post('toggle_has_the_system', {member_id: member.id}).then(function () {
          // Refresh client
          $scope.getClient();
        });
      }
    };

    /**
     * Toggles has the system for the current company
     * @param  {object} company Company to be updated
     * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
     */
    $scope.setHasTheSystemForCompany = function (company) {
      if (confirm("Are you sure you want to toggle the value for the current company?")) {
        Restangular.one('clients', company.id).post('toggle_has_the_system', {member_id: $scope.client.id}).then(function () {
          // Refresh client
          $scope.getClient();
        });
      }
    };

    /**
     * Searches for all possible member filter by name
     * @param  {string} value Name
     * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
     */
    $scope.searchMembers = function (value) {
      return $scope.RestangularClient.getList('potential_members', { field: 'name', term: value }).then(function (members) {
        return members;
      });
    };

    /**
     * Adds a new compnay to the client
     * @param  {Object} company Company object
     * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
     */
    $scope.addCompany = function (company) {
      $scope.client.post('add_company', { company: company }).then(function () {
        // Reset form
        $scope.company = {};
        $scope.add_company_form.$setPristine();
        $scope.add_company_form.$setUntouched();
        // Refresh client info
        $scope.getClient();
      });
    };

    /**
     * Searches for all possible companies filter by name
     * @param  {string} value Name
     * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
     */
    $scope.searchCompanies = function (value) {
      return $scope.RestangularClient.getList('potential_companies', { field: 'name', term: value }).then(function (companies) {
        return companies;
      });
    };

    // Initialize controller
    $scope.init();
  }]);