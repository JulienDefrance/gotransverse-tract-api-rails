module GoTransverseTractApi

  module BillingAccount

    class BillingAccount

      class << self

        #
        # @param {Hash} options
        #
        def find_all options={}
          params ||= GoTransverseTractApi::ApiData.new.get_query_params({}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} eid
        # @param {Hash} options
        #
        def find_by_eid eid, options={}
          return nil unless eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} account_num
        # @param {Hash} options
        #
        def find_by_account_num account_num, options={}
          return nil unless account_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({account_num: account_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} external_account_num
        # @param {Hash} options
        #
        def find_by_external_account_num external_account_num, options={}
          return nil unless external_account_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({external_account_num: external_account_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} party_eid
        # @param {Hash} options
        #
        def find_by_party_eid party_eid, options={}
          return nil unless party_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({party_eid: party_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} status
        # @param {Hash} options
        #
        def find_by_status status, options={}
          return nil unless status.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({status: status}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} email_address
        # @param {Hash} options
        #
        def find_by_email_address email_address, options={}
          return nil unless email_address.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({email_address: email_address}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} billing_account_category_eid
        # @param {Hash} options
        #
        def find_by_billing_account_category_eid billing_account_category_eid, options={}
          return nil unless billing_account_category_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({billing_account_category_eid: billing_account_category_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} purchase_order_number
        # @param {Hash} options
        #
        def find_by_purchase_order_num purchase_order_number, options={}
          return nil unless purchase_order_number.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({purchase_order_number: purchase_order_number}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} order_num
        # @param {Hash} options
        #
        def find_by_order_num order_num, options={}
          return nil unless order_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({order_num: order_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} custom_field_value_eid
        # @param {Hash} options
        #
        def find_by_custom_field_value_eid custom_field_value_eid, options={}
          return nil unless custom_field_value_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({custom_field_value_eid: custom_field_value_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} bill_type
        # @param {Hash} options
        #
        def find_by_bill_type bill_type, options={}
          return nil unless bill_type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({bill_type: bill_type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} referral
        # @param {Hash} options
        #
        def find_by_referral referral, options={}
          return nil unless referral.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({referral: referral}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} billing_account_segment_eid
        # @param {Hash} options
        #
        def find_by_billing_account_segment_eid billing_account_segment_eid, options={}
          return nil unless billing_account_segment_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({billing_account_segment_eid: billing_account_segment_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} currency_type
        # @param {Hash} options
        #
        def find_by_currency_type currency_type, options={}
          return nil unless currency_type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({currency_type: currency_type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} product_eid
        # @param {Hash} options
        #
        def find_by_product_eid product_eid, options={}
          return nil unless product_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_eid: product_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} service_eid
        # @param {Hash} options
        #
        def find_by_service_eid service_eid, options={}
          return nil unless service_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({service_eid: service_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
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
            resumeBillingAccount: {},
            billingAccount: {eid: eid},
            startDate: billing_account[:start_date],
            notes: billing_account[:notes]
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
            addRecurringPaymentToBillingAccount: {},
            billingAccount: {eid: eid},
            recurringPayment: {
              attributes: {},
              referencedCreditCardPaymentMethod: {
                referenceKey: billing_account[:recurring_payment][:referenced_credit_card_payment_method][:reference_key]
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
            changeService: {},
            service: {
              eid: billing_account[:service][:eid]
            },
            order: {
              attributes: {
                note: billing_account[:order][:note]
              },
              orderItems: {
                attributes: {},
                orderItem: {
                  attributes: {
                    quantity: billing_account[:order][:order_items][:order_item][:quantity],
                    description: billing_account[:order][:order_items][:order_item][:description]
                  },
                  products: get_products(billing_account)
                }
              },
              billingAccount: {eid: eid}
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
            addCustomFieldValue: {},
            billingAccount: {eid: eid},
            customFieldValue: {
              value: billing_account[:custom_field_value][:value]
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
            removeCustomFieldValue: {},
            billingAccount: {eid: eid},
            customFieldValue: {
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
            addPersonToBillingAccount: {},
            billingAccount: {eid: eid},
            person: {
              attributes: {
                firstName: billing_account[:person][:first_name],
                lastName: billing_account[:person][:last_name],
                middleName: billing_account[:person][:middle_name]
              },
              addresses: GoTransverseTractApi::ApiData.new.get_addresses(billing_account[:person])
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
            removePersonFromBillingAccount: {},
            billingAccount: { eid: eid },
            person: { eid: billing_account[:person][:eid] }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'removePersonFromBillingAccount')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "removePerson")
        end

        #
        # @param {Long} eid
        # @param {Hash} order_details
        #
        def create_draft_order eid, order_details
          data = {
            createDraftOrder: {},
            salesOrder: GoTransverseTractApi::ApiData.new.sales_order_details(order_details[:sales_order])
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'createDraftOrder')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "createDraftOrder")
        end

        #
        # @param {Long} eid
        # @param {Hash} order_details
        #
        def void_draft_order eid, order_details
          data = {
            voidDraftOrder: {},
            salesOrder: GoTransverseTractApi::ApiData.new.sales_order_details(order_details[:sales_order])
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
          bill_cycle = {}
          recurring_payments = {}

          bill_type = {
            billingAccount: {
              billType: billing_account[:bill_type]
            }
          }

          if billing_account.has_key?(:daily_bill_cycle)
            bill_cycle = {
              dailyBillCycle: {
                eid: billing_account[:daily_bill_cycle][:eid]
              }
            }
          elsif billing_account.has_key?(:monthly_bill_cycle)
            bill_cycle = {
              monthlyBillCycle: {
                eid: billing_account[:monthly_bill_cycle][:eid]
              }
            }
          elsif billing_account.has_key?(:quarterly_bill_cycle)
            bill_cycle = {
              quarterlyBillCycle: {
                eid: billing_account[:quarterly_bill_cycle][:eid]
              }
            }
          elsif billing_account.has_key?(:yearly_bill_cycle)
            bill_cycle = {
              yearlyBillCycle: {
                eid: billing_account[:yearly_bill_cycle][:eid]
              }
            }
          end
           
          data = {
            organization: {
              attributes: {
                name: billing_account[:organization][:name]
              },
              addresses: GoTransverseTractApi::ApiData.new.get_addresses(billing_account[:organization])
            },
            billingAccountCategory: {
              eid: billing_account[:billing_account_category][:eid]
            },
            paymentTerm: {
              name: billing_account[:payment_term][:name],
              eid: billing_account[:payment_term][:eid]
            }
          }
          
          if billing_account.has_key?(:recurring_payments)
            recurring_payments = {
              recurringPayments: {
                attributes: {},
                recurringPayment: {
                  attributes: {},
                  referencedCreditCardPaymentMethod: {
                    referenceKey: billing_account[:recurring_payments][:recurring_payment][:referenced_credit_card_payment_method][:reference_key]
                  }
                }
              }
            }
          end

          data = GoTransverseTractApi::ApiData.new.compact(bill_type.merge bill_cycle.merge data.merge recurring_payments)

          xml_data = GoTransverseTractApi.generateXML(data, 'billingAccount')
          GoTransverseTractApi.post_request_for(self, {}, xml_data, "")
        end

        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def update eid, billing_account
          data = {
            billingAccount: {
              eid: eid,
              billType: billing_account[:bill_type],
              automaticRecurringPayment: billing_account[:automatic_recurring_payment]
            }
          }

          if billing_account[:billing_account_category].present?
            data[:billingAccountCategory] = {
                eid: billing_account[:billing_account_category][:eid]
            }
          end

          if billing_account[:payment_term].present?
            data[:billingAccount][:paymentTerm] = {
                name: billing_account[:payment_term][:name],
                eid: billing_account[:payment_term][:eid]
            }
          end

          xml_data = GoTransverseTractApi.generateXML(data, 'billingAccount')
          GoTransverseTractApi.put_request_for(self, {eid: eid}, xml_data)
        end

        # @param {Long} eid
        # @param {Hash} billing_account
        #
        def update_address eid, billing_account
          data = {
            billingAccount: {
              eid: eid,
              billType: billing_account[:bill_type],
              automaticRecurringPayment: billing_account[:automatic_recurring_payment]
            },
            addresses: GoTransverseTractApi::ApiData.new.get_addresses(billing_account[:organization])
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'billingAccount')
          GoTransverseTractApi.put_request_for(self, {eid: eid}, xml_data)
        end

        private

        def get_products(billing_account)
          products = []
          qty = billing_account[:order][:order_items][:order_item][:quantity]

          (0..qty - 1).each do|i|
            products << {
              product: {
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
