module GoTransverseTractApi

  module Service

    class ServicePriceRange

      class << self

        #
        # @param {Long} eid
        #
        def self.find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} service_price_eid
        #
        def find_by_service_price_eid service_price_eid
          GoTransverseTractApi.get_response_for(self, {service_price_eid: service_price_eid})
        end

      end

    end

  end

end
