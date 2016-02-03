module GoTransverseTractApi

  module Product

    class BillingAccountSegmentField

      class << self

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} billing_account_segment_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_billing_account_segment_eid billing_account_segment_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {billing_account_segment_eid: billing_account_segment_eid, queryScope: query_scope})
        end

        #
        # @param {String} billing_account_segment_name
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_billing_account_segment_name billing_account_segment_name, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {billing_account_segment_name: billing_account_segment_name, queryScope: query_scope})
        end

        #
        # @param {String} type
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_type type, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {type: type, queryScope: query_scope})
        end

        #
        # @param {Boolean} required
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_required required, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {required: required, queryScope: query_scope})
        end

      end

    end

  end

end
