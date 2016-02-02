module GoTransverseTractApi

  module Order

    class RenewalOrder

      class << self

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} order_num
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_order_num order_num, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {order_num: order_num, queryScope: query_scope})
        end

        #
        # @param {Long} billing_account_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_billing_account_eid billing_account_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid, queryScope: query_scope})
        end

        #
        # @param {Long} account_num
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_account_num account_num, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {account_num: account_num, queryScope: query_scope})
        end

        #
        # @param {Long} external_account_num
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_external_account_num external_account_num, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {external_account_num: external_account_num, queryScope: query_scope})
        end

        #
        # @param {Date} order_date
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_order_date order_date, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {order_date: order_date, queryScope: query_scope})
        end

        #
        # @param {String} referral
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_referral referral, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {referral: referral, queryScope: query_scope})
        end

        #
        # @param {Long} purchase_order_number
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_purchase_order_number purchase_order_number, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {purchase_order_number: purchase_order_number, queryScope: query_scope})
        end

        #
        # @param {Date} renewal_date
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_renewal_date renewal_date, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {renewal_date: renewal_date, queryScope: query_scope})
        end

        #
        # @param {Long} custom_field_value_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_custom_field_value_eid custom_field_value_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {custom_field_value_eid: custom_field_value_eid , queryScope: query_scope})
        end

      end

    end

  end

end
