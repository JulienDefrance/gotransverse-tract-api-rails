module GoTransverseTractApi

  module Order

    class SalesOrder

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
        # @param {Long} order_num
        #
        def find_by_order_num order_num
          GoTransverseTractApi.get_response_for(self, {order_num: order_num})
        end

        #
        # @param {Long} billing_account_eid
        #
        def find_by_billing_account_eid billing_account_eid
          GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid})
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
        # @param {Date} order_date
        #
        def find_by_order_date order_date
          GoTransverseTractApi.get_response_for(self, {order_date: order_date})
        end

        #
        # @param {String} referral
        #
        def find_by_referral referral
          GoTransverseTractApi.get_response_for(self, {referral: referral})
        end

        #
        # @param {Long} purchase_order_num
        #
        def find_by_purchase_order_num purchase_order_num
          GoTransverseTractApi.get_response_for(self, {purchase_order_num: purchase_order_num})
        end

        #
        # @param {String} status
        #
        def find_by_status status
          GoTransverseTractApi.get_response_for(self, {status: status})
        end

        #
        # @param {Long} custom_field_value_eid
        #
        def find_by_custom_field_value_eid custom_field_value_eid
          GoTransverseTractApi.get_response_for(self, {custom_field_value_eid: custom_field_value_eid})
        end

        #
        # @param {Long} eid
        # @param {Long} sequence
        # @param {Hash} sales_order
        #
        def approve eid, sequence, sales_order
          GoTransverseTractApi.post_request_for(self, {eid: eid}, sales_order, "item/#{sequence}/approve")
        end

        #
        # @param {Long} eid
        # @param {Long} sequence
        # @param {Hash} sales_order
        #
        def deny eid, sequence, sales_order
          GoTransverseTractApi.post_request_for(self, {eid: eid}, sales_order, "item/#{sequence}/deny")
        end

        #
        # @param {Long} eid
        # @param {Hash} sales_order
        #
        def confirm eid, sales_order
          GoTransverseTractApi.post_request_for(self, {eid: eid}, sales_order)
        end

        #
        # @param {Long} eid
        # @param {Hash} sales_order
        #
        def self.add_custom_field_value eid, sales_order
          GoTransverseTractApi.post_request_for(self, {eid: eid}, sales_order, "addCustomFieldValue")
        end

        #
        # @param {Long} eid
        # @param {Hash} sales_order
        #
        def self.remove_custom_field_value eid, sales_order
          GoTransverseTractApi.post_request_for(self, {eid: eid}, sales_order, "removeCustomFieldValue")
        end

        #
        # @param {Hash} person
        #
        def self.create_sales_order sales_order
          GoTransverseTractApi.post_request_for(self, {}, sales_order, "")
        end


      end

    end

  end

end
