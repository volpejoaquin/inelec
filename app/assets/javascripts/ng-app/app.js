window.Inelec =
  angular
    .module( 'inelec', [
      'ngAnimate',
      'ui.router',
      'ui.bootstrap',
      'templates',
      'mgcrea.ngStrap',
      'restangular',
      'angular.filter'
    ] )
    .config(
      [
        '$stateProvider',
        '$urlRouterProvider',
        '$locationProvider',
        'RestangularProvider',
        function(
          $stateProvider,
          $urlRouterProvider,
          $locationProvider,
          RestangularProvider
        ) {
          /**
           * Routes and States
           */
          $stateProvider
            .state( 'home', {
              url: '/',
              templateUrl: 'index.html',
              controller: 'MainCtrl'
            } )

            .state( 'clients', {
              abstract: true,
              url: '/clients',
              controller: 'ClientsCtrl',
              template: '<ui-view/>'
            } )
              .state( 'clients.list', {
                url: '/list',
                views: {
                  '': {
                    templateUrl: 'clients/list.html'
                  },
                  'quick-add@clients.list': {
                    templateUrl: 'clients/form.html',
                    controller: 'ClientQuickAddCtrl'
                  }
                }
              } )
              .state( 'clients.show', {
                url: '/:id',
                views: {
                  '': {
                    templateUrl: 'clients/show.html',
                    controller: 'ClientShowCtrl'
                  },
                  'contact-people@clients.show': {
                    templateUrl: 'clients/contact_people/list.html',
                    controller: 'ContactPeopleCtrl'
                  },
                  'entry-orders@clients.show': {
                    templateUrl: 'clients/entry-orders/list.html',
                    controller: 'EntryOrdersCtrl'
                  },
                  'exit-orders@clients.show': {
                    templateUrl: 'clients/exit-orders/list.html',
                    controller: 'EntryOrdersCtrl'
                  }
                }
              } )
              .state( 'clients.edit', {
                url: '/:id/edit',
                views: {
                  '': {
                    templateUrl: 'clients/edit.html'
                  },
                  'form@clients.edit': {
                    templateUrl: 'clients/form.html',
                    controller: 'ClientEditCtrl'
                  }
                }
              } )
            .state( 'entryorders', {
              abstract: true,
              url: '/clients/:id/entry_orders',
              controller: 'EntryOrdersCtrl',
              template: '<ui-view/>'
            } )
             .state( 'entryorders.show', {
                url: '/:entry_order_id',
                views: {
                  '': {
                    templateUrl: 'clients/entry_order/show.html',
                    controller: 'EntryOrderShowCtrl'
                  }
                }
              } );

          // Redirect abstract controllers to lists
          $urlRouterProvider
            .when( '/clients', '/clients/list' );

          // default fall back route
          $urlRouterProvider.otherwise( '/' );

          // enable HTML5 Mode for SEO
          $locationProvider.html5Mode( true );

          // Setup Restangular global parameters
          RestangularProvider.setBaseUrl( '/api' );
          RestangularProvider.setRequestSuffix( '.json' );
        }
      ]
    );
