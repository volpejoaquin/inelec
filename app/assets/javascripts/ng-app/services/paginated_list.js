Inelec
  .factory(
    'paginatedList',
    function() {
      'use strict';

      /**
       * I'm creating a function because I need the service to have its own data in each controller that is used
       * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
       */
      return function( items ) {
        var
          paginatedList = {
            itemsPerPage: 10
          };

        /**
         * Sets the items for pagination
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        paginatedList.setItems = function( items ) {
          paginatedList.items = items;
          paginatedList.currentPage = 1;
          paginatedList.totalItems = !!items ? items.length : 0;
          // Set paged items
          paginatedList.pageChanged();
        };

        /**
         * Page changed callback
         * @author Joaquin Volpe <joaquin.volpe@woopasoft.com>
         */
        paginatedList.pageChanged = function() {
          // If no items, do nothing
          if ( !paginatedList.items ) {
            return;
          }
          var start = ( paginatedList.currentPage - 1 ) * paginatedList.itemsPerPage;
          paginatedList.pagedItems = paginatedList.items.slice(
            start,
            start + paginatedList.itemsPerPage
          );
        };

        // Set items
        if ( items ) {
          paginatedList.setItems( items );
        }

        return paginatedList;
      };
    }
  );
