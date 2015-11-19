module GoTransverseTractApi

  module Order

    class RenewalOrder

      class << self

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
        # @param {Long} purchase_order_number
        #
        def find_by_purchase_order_number purchase_order_number
          GoTransverseTractApi.get_response_for(self, {purchase_order_number: purchase_order_number})
        end

        #
        # @param {Date} renewal_date
        #
        def find_by_renewal_date renewal_date
          GoTransverseTractApi.get_response_for(self, {renewal_date: renewal_date})
        end

        #
        # @param {Long} custom_field_value_eid
        #
        def find_by_custom_field_value_eid custom_field_value_eid
          GoTransverseTractApi.get_response_for(self, {custom_field_value_eid: custom_field_value_eid})
        end

      end

    end

  end

end
