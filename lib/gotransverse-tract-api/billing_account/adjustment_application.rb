module GoTransverseTractApi

  module BillingAccount

    class AdjustmentApplication

      class << self

        #
        # @param {Long} eid
        # @param {Hash} options
        #
        def find_by_eid eid, options={}
          return nil unless eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} adjustment_eid
        # @param {Hash} options
        #
        def find_by_adjustment_eid adjustment_eid, options={}
          return nil unless adjustment_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({adjustment_eid: adjustment_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end

