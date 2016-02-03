module GoTransverseTractApi

  module Usage

    class UsageLookupTable

      class << self

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
        # @param {String} status
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_status status, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {status: status, queryScope: query_scope})
        end

      end

    end

  end

end
