module GoTransverseTractApi

  module Usage

    class GlobalUsageRule

      class << self

        def find_by_all 
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
        # @param {Boolean} is_global
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_is_global is_global, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {is_global: is_global, queryScope: query_scope})
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
