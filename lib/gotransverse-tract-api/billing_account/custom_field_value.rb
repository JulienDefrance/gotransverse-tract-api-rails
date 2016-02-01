module GoTransverseTractApi

  module BillingAccount

    class CustomFieldValue

      class << self

        def find_all
          GoTransverseTractApi.get_response_for(self)
        end

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
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
        # @param {Long} billing_account_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_billing_account_eid billing_account_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid, queryScope: query_scope})
        end

        #
        # @param {Long} custom_field_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_custom_field_eid custom_field_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {custom_field_eid: custom_field_eid, queryScope: query_scope})
        end

        #
        # @param {Long} order_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_order_eid order_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {order_eid: order_eid, queryScope: query_scope})
        end

        #
        # @param {Long} service_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_service_eid service_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {service_eid: service_eid, queryScope: query_scope})
        end

        #
        # @param {Long} order_item_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_order_item_eid order_item_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {order_item_eid: order_item_eid, queryScope: query_scope})
        end

        #
        # @param {Long} order_num
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_order_num order_num, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {order_num: order_num, queryScope: query_scope})
        end

        #
        # @param {String} custom_field_name
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_custom_field_name custom_field_name, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {custom_field_name: custom_field_name, queryScope: query_scope})
        end

        #
        # @param {Long} value
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_value value, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {value: value, queryScope: query_scope})
        end

      end

    end

  end

end
