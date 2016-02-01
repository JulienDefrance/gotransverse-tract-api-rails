module GoTransverseTractApi

  module BillingAccount

    class CustomField

      class << self

        def find_all
          GoTransverseTractApi.get_response_for(self)
        end

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {String} name
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_name name, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {name: name, queryScope: query_scope})
        end

        #
        # @param {String} type
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_type type, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {type: type, queryScope: query_scope})
        end

        #
        # @param {Boolean} enabled
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_enabled enabled, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {enabled: enabled, queryScope: query_scope})
        end

        #
        # @param {Boolean} searchable
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_searchable searchable, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {searchable: searchable, queryScope: query_scope})
        end

      end

    end

  end

end
