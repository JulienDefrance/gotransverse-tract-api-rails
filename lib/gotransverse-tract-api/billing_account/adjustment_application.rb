module GoTransverseTractApi

  module BillingAccount

    class AdjustmentApplication

      class << self

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} adjustment_eid
        #
        def find_by_adjustment_eid adjustment_eid
          GoTransverseTractApi.get_response_for(self, {adjustment_eid: adjustment_eid})
        end

      end

    end

  end

end

