module GoTransverseTractApi

  module Usage

    class UsageRule

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
        # @param {Long} service_period_eid
        # @param {Hash} options
        #
        def find_by_service_period_eid service_period_eid, options=nil
          return nil unless service_period_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({service_period_eid: service_period_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
