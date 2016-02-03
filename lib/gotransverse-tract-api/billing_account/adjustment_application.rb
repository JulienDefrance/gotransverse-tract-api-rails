module GoTransverseTractApi

  module BillingAccount

    class AdjustmentApplication

      class << self

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} adjustment_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_adjustment_eid adjustment_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {adjustment_eid: adjustment_eid, queryScope: query_scope})
        end

      end

    end

  end

end

