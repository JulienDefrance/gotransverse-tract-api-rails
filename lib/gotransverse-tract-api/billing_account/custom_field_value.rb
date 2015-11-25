module GoTransverseTractApi

  module BillingAccount

    class CustomFieldValue

      class << self

        def find_all
          GoTransverseTractApi.get_response_for(self)
        end

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} account_num
        #
        def find_by_account_num account_num
          GoTransverseTractApi.get_response_for(self, {account_num: account_num})
        end

        #
        # @param {Long} external_account_num
        #
        def find_by_external_account_num external_account_num
          GoTransverseTractApi.get_response_for(self, {external_account_num: external_account_num})
        end

        #
        # @param {Long} billing_account_eid
        #
        def find_by_billing_account_eid billing_account_eid
          GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid})
        end

        #
        # @param {Long} custom_field_eid
        #
        def find_by_custom_field_eid custom_field_eid
          GoTransverseTractApi.get_response_for(self, {custom_field_eid: custom_field_eid})
        end

        #
        # @param {Long} order_eid
        #
        def find_by_order_eid order_eid
          GoTransverseTractApi.get_response_for(self, {order_eid: order_eid})
        end

        #
        # @param {Long} service_eid
        #
        def find_by_service_eid service_eid
          GoTransverseTractApi.get_response_for(self, {service_eid: service_eid})
        end

        #
        # @param {Long} order_item_eid
        #
        def find_by_order_item_eid order_item_eid
          GoTransverseTractApi.get_response_for(self, {order_item_eid: order_item_eid})
        end

        #
        # @param {Long} order_num
        #
        def find_by_order_num order_num
          GoTransverseTractApi.get_response_for(self, {order_num: order_num})
        end

        #
        # @param {String} custom_field_name
        #
        def find_by_custom_field_name custom_field_name
          GoTransverseTractApi.get_response_for(self, {custom_field_name: custom_field_name})
        end

        #
        # @param {Long} value
        #
        def find_by_value value
          GoTransverseTractApi.get_response_for(self, {value: value})
        end

      end

    end

  end

end
