module GoTransverseTractApi

  module Order

    class BillingAccountCategory

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
        # @param {String} desc
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_desc desc, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {desc: desc, queryScope: query_scope})
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
