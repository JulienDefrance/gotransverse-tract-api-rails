module GoTransverseTractApi

  module Usage

    class UsageLookupTableEntry

      class << self

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} usage_lookup_table_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_usage_lookup_table_eid usage_lookup_table_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {usage_lookup_table_eid: usage_lookup_table_eid, queryScope: query_scope})
        end

        #
        # @param {String} key
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_key key, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {key: key, queryScope: query_scope})
        end

        #
        # @param {String} value
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_value value, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {value: value, queryScope: query_scope})
        end

      end

    end

  end

end
