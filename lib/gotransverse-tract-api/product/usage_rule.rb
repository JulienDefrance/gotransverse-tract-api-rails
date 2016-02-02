module GoTransverseTractApi

  module Product

    class UsageRule

      #
      # @param {Long} eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_eid eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
      end

      #
      # @param {Long} service_period_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_service_period_eid service_period_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {service_period_eid: service_period_eid, queryScope: query_scope})
      end

    end

  end

end
