module GoTransverseTractApi

  module Product

    class BillingAccountSegmentField

      class << self

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} billing_account_segment_eid
        #
        def find_by_billing_account_segment_eid billing_account_segment_eid
          GoTransverseTractApi.get_response_for(self, {billing_account_segment_eid: billing_account_segment_eid})
        end

        #
        # @param {String} billing_account_segment_name
        #
        def find_by_billing_account_segment_name billing_account_segment_name
          GoTransverseTractApi.get_response_for(self, {billing_account_segment_name: billing_account_segment_name})
        end

        #
        # @param {String} type
        #
        def find_by_type type
          GoTransverseTractApi.get_response_for(self, {type: type})
        end

        #
        # @param {Boolean} required
        #
        def find_by_required required
          GoTransverseTractApi.get_response_for(self, {required: required})
        end

      end

    end

  end

end
