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
          payment = sales_order[:payment]
          sales_order = sales_order[:sales_order]

          order_item_struct = prepare_products_struct(sales_order)

          data = {
            confirmOrder: {},
            salesOrder: {
              attributes: {
                referral: sales_order[:referral],
                orderDate: sales_order[:order_date],
                orderStatus: sales_order[:order_status],
                eid: eid
              },
              orderItems: {
                attributes: GoTransverseTractApi::ApiData.new.get_page_info(sales_order[:order_items]),
                orderItem: order_item_struct
              },
              billingAccount: {
                automaticRecurringPayment: sales_order[:billing_account][:automatic_recurring_payment],
                eid: sales_order[:billing_account][:eid]
              }
            },
            payment: {
              attributes: {
                amount: payment[:amount],
                description: payment[:description]
              },
              billingAccount: {
                automaticRecurringPayment: payment[:billing_account][:automatic_recurring_payment],
                eid: payment[:billing_account][:eid]
              },
              creditCardPayment: {
                cardType: payment[:credit_card_payment][:card_type],
                cardHolderFirstName: payment[:credit_card_payment][:card_holder_first_name],
                cardHolderMiddleName: payment[:credit_card_payment][:card_holder_middle_name],
                cardHolderLastName: payment[:credit_card_payment][:card_holder_last_name],
                cardIdentifierNumber: payment[:credit_card_payment][:card_identifier_number],
                cardExpiration: payment[:credit_card_payment][:card_expiration]
              }
            }
          }
           
          xml_data = GoTransverseTractApi.generateXML(data, 'confirmOrder')     

          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, 'confirm')
        end

        #
        # @param {Long} eid
        # @param {Hash} sales_order
        #
        def add_custom_field_value(eid, sales_order)
          data = 
            {
              addCustomFieldValue: {},
              order: { eid: eid },
              customFieldValue: { value: sales_order[:value] }
            }

          xml_data = GoTransverseTractApi.generateXML(data,'addCustomFieldValue')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, sales_order, "addCustomFieldValue")
        end

        #
        # @param {Long} eid
        # @param {Hash} sales_order
        #
        def remove_custom_field_value eid, sales_order
          data = {
            removeCustomFieldValue: {},
            order: { eid: eid },
            customFieldValue: { eid: sales_order[:eid] }
          }
 
          xml_data = GoTransverseTractApi.generateXML(data,'removeCustomFieldValue')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, sales_order, "removeCustomFieldValue")
        end

        #
        # @param {Hash} sales_order
        #
        def create_sales_order sales_order
          data = {
            salesOrder: {
              note: sales_order[:note],
              purchaseOrderNumber: sales_order[:purchase_order_number]
            },
            orderItems: {
              attributes: {},
              orderItem: get_product_struct(sales_order)
            },
            billingAccount: {
              attributes: {
                billType: sales_order[:billing_account][:bill_type],
                automaticRecurringPayment: sales_order[:billing_account][:automatic_recurring_payment]
              },
              dailyBillCycle: {
                attributes: {
                  eid: sales_order[:billing_account][:daily_bill_cycle][:eid]
                }
              },
              organization: {
                attributes: {
                  name: sales_order[:billing_account][:organization][:name],
                  taxIdNumber: sales_order[:billing_account][:organization][:tax_id_number]
                },
                addresses: {
                  attributes: {},
                  postalAddress: get_address_struct(sales_order),
                  telecomAddress: {
                    attributes: {
                      dialingPrefix: sales_order[:billing_account][:organization][:addresses][:telecom_address][:dialing_prefix],
                      countryCode: sales_order[:billing_account][:organization][:addresses][:telecom_address][:country_code],
                      areaCode: sales_order[:billing_account][:organization][:addresses][:telecom_address][:area_code],
                      number: sales_order[:billing_account][:organization][:addresses][:telecom_address][:number],
                      extension: sales_order[:billing_account][:organization][:addresses][:telecom_address][:extension],
                      purpose: sales_order[:billing_account][:organization][:addresses][:telecom_address][:purpose]
                    }
                  },
                  emailAddress: {
                    attributes: {
                      email: sales_order[:billing_account][:organization][:addresses][:email_address][:email],
                      purpose: sales_order[:billing_account][:organization][:addresses][:email_address][:purpose]
                    }
                  }
                }
              },
              billingAccountCategory: {
                attributes: {
                  eid: sales_order[:billing_account][:billing_account_category][:eid]
                }
              }
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'salesOrder')     
          GoTransverseTractApi.post_request_for(self, xml_data, "")
        end



        private

        #
        # @param {Hash} sales_order
        # Return {Hash} products
        #
        def get_product_struct(sales_order)
          products = {}
          items = []

          order_item = {
            attributes: {
               quantity: sales_order[:order_items][:order_item][:quantity],
               sequence: sales_order[:order_items][:order_item][:sequence],
               description: sales_order[:order_items][:order_item][:description]
            }
          }

          items = sales_order[:order_items][:order_item][:product]
          (0..items.size - 1).each do|i|
            products = {
              product: {
                attributes: {
                  eid: items[i][:eid]
                }
              }
            }
          end

          order_item.merge products
        end

        #
        # @param {Hash} sales_order
        # Return {Hash} postal_addresses
        #
        def get_address_struct(sales_order)
          postal_addresses = []
          items = []

          items = sales_order[:billing_account][:organization][:addresses][:postal_address]

          (0..items.size - 1).each do|i|
            postal_addresses << {
              postalAddress: {
                attributes: {
                  purpose: items[i][:purpose],
                  country: items[i][:country],
                  city: items[i][:city],
                  regionOrState: items[i][:region_or_state],
                  postalCode: items[i][:postal_code],
                  line1: items[i][:line1],
                  line2: items[i][:line2]
                }
              }
            }
          end

          postal_addresses
        end


        #
        # @param {Hash} sales_order
        # Return {Hash} products
        #
        def prepare_products_struct(sales_order)
          products = {}
          items = []

          order_item = {
            attributes: {
               quantity: sales_order[:order_items][:order_item][:quantity]
            }
          }

          items = sales_order[:order_items][:order_item][:product]
          (0..items.size - 1).each do|i|
            products = {
              product: {
                attributes: {
                  name: items[i][:name],
                  description: items[i][:description],
                  shortDescription: items[i][:short_description],
                  productTypeCode: items[i][:product_type_code],
                  productState: items[i][:product_state],
                  requiresAgreement: items[i][:requires_agreement],
                  serialized: items[i][:serialized],
                  taxable: items[i][:taxable],
                  trial: items[i][:trial],
                  defaultQuantity: items[i][:default_quantity],
                  minServiceResources: items[i][:min_service_resources],
                  maxServiceResources: items[i][:max_service_resources],
                  trialOverride: items[i][:trial_override],
                  eid: items[i][:eid]
                },
                productPrices: {
                  attributes: GoTransverseTractApi::ApiData.new.get_page_info(items[i][:product_prices]),
                  productPrice: {
                    attributes: {
                      fromDate: items[i][:product_prices][:product_price][:from_date],
                      priceOverride: items[i][:product_prices][:product_price][:price_override],
                      type: items[i][:product_prices][:product_price][:type],
                      recurringPaymentRequired: items[i][:product_prices][:product_price][:recurring_payment_required],
                      eid: items[i][:product_prices][:product_price][:eid]
                    },
                    priceRanges: {
                      attributes: GoTransverseTractApi::ApiData.new.get_page_info(items[i][:product_prices][:product_price][:price_ranges]),
                      priceRange: {
                        quantityBeginRange: items[i][:product_prices][:product_price][:price_ranges][:price_range][:quantity_begin_range],
                        price: items[i][:product_prices][:product_price][:price_ranges][:price_range][:price],
                        level: items[i][:product_prices][:product_price][:price_ranges][:price_range][:level],
                        eid: items[i][:product_prices][:product_price][:price_ranges][:price_range][:eid]
                      }
                    }
                  }
                },
                productCategory: {
                  name: items[i][:product_category][:name],
                  description: items[i][:product_category][:description],
                  status: items[i][:product_category][:status],
                  eid: items[i][:product_category][:eid]
                },
                actions: GoTransverseTractApi::ApiData.new.get_page_info(items[i][:actions]),
                productUsageRules: GoTransverseTractApi::ApiData.new.get_page_info(items[i][:product_usage_rules])
              }
            }
          end

          order_item.merge products
        end

      end

    end

  end

end
