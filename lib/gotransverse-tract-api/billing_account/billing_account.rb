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
          xml_data = GoTransverseTractApi::ApiData.new.payment_details(billing_account, 'Y')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "applyPayment")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def suspend eid, billing_account
          xml_data = GoTransverseTractApi::ApiData.new.shutdown(billing_account, eid, 'suspendBillingAccount')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "suspend")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def resume eid, billing_account
          data = {
            :resumeBillingAccount => {},
            :billingAccount => {eid: eid},
            :startDate => billing_account[:start_date],
            :notes => billing_account[:notes]
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'resumeBillingAccount')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "resume")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def add_recurring_payment eid, billing_account
          data = {
            :addRecurringPaymentToBillingAccount => {},
            :billingAccount => {eid: eid},
            :recurringPayment => {
              :attributes => {},
              :creditCardPaymentMethod => {
                :cardType => billing_account[:recurring_payment][:credit_card_payment_method][:card_type],
                :cardHolderFirstName => billing_account[:recurring_payment][:credit_card_payment_method][:card_holder_first_name],
                :cardHolderLastName => billing_account[:recurring_payment][:credit_card_payment_method][:card_holder_last_name],
                :cardIdentifierNumber => billing_account[:recurring_payment][:credit_card_payment_method][:card_identifier_number],
                :cardExpiration => billing_account[:recurring_payment][:credit_card_payment_method][:card_expiration]
              }
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'addRecurringPaymentToBillingAccount')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "addRecurringPayment")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def change_service eid, billing_account
          data = {
            :changeService => {},
            :service => {
              eid: billing_account[:service][:eid]
            },
            :order => {
              :attributes => {
                :note => billing_account[:order][:note]
              },
              :orderItems => {
                :attributes => {},
                :orderItem => {
                  :attributes => {
                    :quantity => billing_account[:order][:order_items][:order_item][:quantity],
                    :description => billing_account[:order][:order_items][:order_item][:description]
                  },
                  :products => get_products(billing_account)
                }
              },
              :billingAccount => {eid: eid}
            }  
          }
          xml_data = GoTransverseTractApi.generateXML(data, 'changeService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "changeService")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def add_custom_field_value eid, billing_account
          data = {
            :addCustomFieldValue => {},
            :billingAccount => {eid: eid},
            :customFieldValue => {
              :value => billing_account[:custom_field_value][:value]
            }
          }
          xml_data = GoTransverseTractApi.generateXML(data, 'addCustomFieldValue')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, billing_account, "addCustomFieldValue")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def remove_custom_field_value eid, billing_account
          data = {
            :removeCustomFieldValue => {},
            :billingAccount => {eid: eid},
            :customFieldValue => {
              eid: billing_account[:custom_field_value][:eid]
            }
          }
          xml_data = GoTransverseTractApi.generateXML(data, 'removeCustomFieldValue')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "removeCustomFieldValue")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def add_person eid, billing_account
          data = {
            :addPersonToBillingAccount => {},
            :billingAccount => {eid: eid},
            :person => {
              :attributes => {
                :firstName => billing_account[:person][:first_name],
                :lastName => billing_account[:person][:last_name],
                :middleName => billing_account[:person][:middle_name]
              },
              :addresses => GoTransverseTractApi::ApiData.new.get_addresses(billing_account[:person])
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'addPersonToBillingAccount')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "addPerson")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def remove_billing_account eid, billing_account
          data = {
            :removePersonFromBillingAccount => {},
            :billingAccount => { eid: eid },
            :person => { eid: billing_account[:person][:eid] }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'removePersonFromBillingAccount')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "removePerson")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def create_draft_order eid, billing_account
          data = {
            :createDraftOrder => {},
            :salesOrder => GoTransverseTractApi::ApiData.new.sales_order_details(billing_account[:sales_order])
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'createDraftOrder')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "createDraftOrder")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def void_draft_order eid, billing_account
          data = {
            :voidDraftOrder => {},
            :salesOrder => GoTransverseTractApi::ApiData.new.sales_order_details(billing_account[:sales_order])
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'voidDraftOrder')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "voidDraftOrder")
        end

        #
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def deactivate eid, billing_account
          xml_data = GoTransverseTractApi::ApiData.new.shutdown(billing_account, eid, 'deactivateBillingAccount')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "deactivate")
        end

        #
        # @param {Hash} billing_account
        #
        def create_billing_account billing_account
          data = {
            :billingAccount => {
              :billType => billing_account[:bill_type]
            },
            :dailyBillCycle => {
              eid: billing_account[:daily_bill_cycle][:eid]
            },
            :organization => {
              :attributes => {
                :name => billing_account[:organization][:name]
              },
              :addresses => GoTransverseTractApi::ApiData.new.get_addresses(billing_account[:organization])
            },
            :billingAccountCategory => {
              eid: billing_account[:billing_account_category][:eid]
            }
          }
          xml_data = GoTransverseTractApi.generateXML(data, 'billingAccount')
          GoTransverseTractApi.post_request_for(self, {}, xml_data, "")
        end

        
        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def update eid, billing_account
          GoTransverseTractApi.put_request_for(self, {eid: eid}, billing_account)
        end

        private

        def get_products(billing_account)
          products = []
          qty = billing_account[:order][:order_items][:order_item][:quantity]

          (0..qty - 1).each do|i|
            products << {
              :product => {
                eid: billing_account[:order][:order_items][:order_item][:products][i][:eid]
              }
            }
          end         

          products
        end
      end

    end

  end

end
