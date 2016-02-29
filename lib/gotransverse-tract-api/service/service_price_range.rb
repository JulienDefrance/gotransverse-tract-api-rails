module GoTransverseTractApi

  module Service

    class ServicePriceRange

      class << self

        #
        # @param {Long} eid
        # @param {Hash} options
        #
        def find_by_eid eid, options=nil
          return nil unless eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} service_price_eid
        # @param {Hash} options
        #
        def find_by_service_price_eid service_price_eid, options=nil
          return nil unless service_price_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({service_price_eid: service_price_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
