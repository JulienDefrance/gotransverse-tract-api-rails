module GoTransverseTractApi

  module Service

    class ServicePriceRange

      class << self

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def self.find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} service_price_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_service_price_eid service_price_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {service_price_eid: service_price_eid, queryScope: query_scope})
        end

      end

    end

  end

end
