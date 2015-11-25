module GoTransverseTractApi

  module BillingAccount

    class BillingAccount

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
        # @param {Long} party_eid
        #
        def find_by_party_eid party_eid
          GoTransverseTractApi.get_response_for(self, {party_eid: party_eid})
        end

        #
        # @param {String} status
        #
        def find_by_status status
          GoTransverseTractApi.get_response_for(self, {status: status})
        end

        #
        # @param {String} email_address
        #
        def find_by_email_address email_address
          GoTransverseTractApi.get_response_for(self, {email_address: email_address})
        end

        #
        # @param {Long} billing_account_category_eid
        #
        def find_by_billing_account_category_eid billing_account_category_eid
          GoTransverseTractApi.get_response_for(self, {billing_account_category_eid: billing_account_category_eid})
        end

        #
        # @param {Long} purchase_order_number
        #
        def find_by_purchase_order_number purchase_order_number
          GoTransverseTractApi.get_response_for(self, {purchase_order_number: purchase_order_number})
        end

        #
        # @param {Long} order_num
        #
        def find_by_order_num order_num
          GoTransverseTractApi.get_response_for(self, {order_num: order_num})
        end

        #
        # @param {Long} custom_field_value_eid
        #
        def find_by_custom_field_value_eid custom_field_value_eid
          GoTransverseTractApi.get_response_for(self, {custom_field_value_eid: custom_field_value_eid})
        end

        #
        # @param {String} bill_type
        #
        def find_by_bill_type bill_type
          GoTransverseTractApi.get_response_for(self, {bill_type: bill_type})
        end

        #
        # @param {String} referral
        #
        def find_by_referral referral
          GoTransverseTractApi.get_response_for(self, {referral: referral})
        end

        #
        # @param {Long} billing_account_segment_eid
        #
        def find_by_billing_account_segment_eid billing_account_segment_eid
          GoTransverseTractApi.get_response_for(self, {billing_account_segment_eid: billing_account_segment_eid})
        end

        #
        # @param {String} currency_type
        #
        def find_by_currency_type currency_type
          GoTransverseTractApi.get_response_for(self, {currency_type: currency_type})
        end

        #
        # @param {Long} product_eid
        #
        def find_by_product_eid product_eid
          GoTransverseTractApi.get_response_for(self, {product_eid: product_eid})
        end

        #
        # @param {Long} service_eid
        #
        def find_by_service_eid service_eid
          GoTransverseTractApi.get_response_for(self, {service_eid: service_eid})
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def apply_payment eid, billing_account
          GoTransverseTractApi.post_request_for(self, {eid: eid}, billing_account, "applyPayment")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def suspend eid, billing_account
          GoTransverseTractApi.post_request_for(self, {eid: eid}, billing_account, "suspend")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def resume eid, billing_account
          GoTransverseTractApi.post_request_for(self, {eid: eid}, billing_account, "resume")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def add_recurring_payment eid, billing_account
          GoTransverseTractApi.post_request_for(self, {eid: eid}, billing_account, "addRecurringPayment")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def change_service eid, billing_account
          GoTransverseTractApi.post_request_for(self, {eid: eid}, billing_account, "changeService")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def add_custom_field_value eid, billing_account
          GoTransverseTractApi.post_request_for(self, {eid: eid}, billing_account, "addCustomFieldValue")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def remove_custom_field_value eid, billing_account
          GoTransverseTractApi.post_request_for(self, {eid: eid}, billing_account, "removeCustomFieldValue")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def add_person eid, billing_account
          GoTransverseTractApi.post_request_for(self, {eid: eid}, billing_account, "addPerson")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def remove_billing_account eid, billing_account
          GoTransverseTractApi.post_request_for(self, {eid: eid}, billing_account, "removePerson")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def create_draft_order eid, billing_account
          GoTransverseTractApi.post_request_for(self, {eid: eid}, billing_account, "createDraftOrder")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def void_draft_order eid, billing_account
          GoTransverseTractApi.post_request_for(self, {eid: eid}, billing_account, "voidDraftOrder")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def deactivate eid, billing_account
          GoTransverseTractApi.post_request_for(self, {eid: eid}, billing_account, "deactivate")
        end

        #
        # @param {Hash} billing_account
        #
        def create_billing_account billing_account
          GoTransverseTractApi.post_request_for(self, {}, billing_account, "")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def update eid, billing_account
          GoTransverseTractApi.put_request_for(self, {eid: eid}, billing_account)
        end

      end

    end

  end

end
