module GoTransverseTractApi
  class ApiData

    def payment_details(invoice, billing_account=nil)
      data = {
        applyPayment: {},
        billingAccount: {
          eid: invoice[:billing_account][:eid]
        },
        invoice: {
          eid: invoice[:invoice][:eid]
        },
        payment: {
          attributes: {
            amount: invoice[:payment][:amount],
            useRecurringPayment: invoice[:payment][:use_recurring_payment]
          },
          creditCardPayment: {
            cardType: invoice[:payment][:credit_card_payment][:card_type],
            cardHolderFirstName: invoice[:payment][:credit_card_payment][:card_holder_first_name],
            cardHolderLastName: invoice[:payment][:credit_card_payment][:card_holder_last_name],
            cardIdentifierNumber: invoice[:payment][:credit_card_payment][:card_identifier_number],
            cardVerificationNumber: invoice[:payment][:credit_card_payment][:card_verification_number],
            cardExpiration: invoice[:payment][:credit_card_payment][:card_expiration]
          },
          billingAccount: {
            eid: invoice[:payment][:billing_account][:eid]
          }
        }
      }

      if(billing_account)
        data[:payment][:creditCardPayment][:description] = invoice[:payment][:credit_card_payment][:description]
      end
      GoTransverseTractApi.generateXML(data, 'applyPayment')
    end
 
    # To suspend or deactivate the account
    def shutdown(billing_account, eid, root_elem)
      data = {
        billingAccount: {eid: eid},
        reason: {eid: billing_account[:reason][:eid]}
      }

      data[root_elem.to_sym] = {}

      GoTransverseTractApi.generateXML(data, root_elem)
    end

    # Returns {Hash} a list of sales order details
    def sales_order_details(sales_order)
      so_details = {
        attributes: {
          referral: sales_order[:referral],
          orderDate: sales_order[:order_date],
          orderStatus: sales_order[:order_status]
        },
        customFieldValues: BillingAccount::CustomFieldValue.get_custom_field_values(sales_order[:custom_field_values]), 
        orderItems: {
          attributes: {},
          orderItem: Order::OrderItem.get_order_item(sales_order[:order_items][:order_item])
        },
        billingAccount: get_billing_account(sales_order[:billing_account])
      }

      so_details
    end

    # Returns [Array]  Products 
    def get_products(sales_order)
      products = []

      items = sales_order[:order_items][:order_item][:products]

      (0..items.size - 1).each do|i|
        products << {
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
              attributes: get_page_info(items[i][:product_prices]),
              productPrices: get_product_prices(items[i])
            },
            productCategory: {
              name: items[i][:product_category][:name],
              description: items[i][:product_category][:description],
              status: items[i][:product_category][:status],
              eid: items[i][:product_category][:eid]
            },
            actions: get_page_info(items[i][:actions]),
            productUsageRules: get_page_info(items[i][:product_usage_rules])
          }
        }
      end

      products
    end

    # Returns [Array]  Product Prices 
    def get_product_prices(product)
      product_prices = []

      count = product[:product_prices][:total_elements].to_i

      (0..count - 1).each do|i|
        product_price = product[:product_prices][:productprices][i]

        product_prices << {
          productPrice: {
            attributes: {
              fromDate: product_price[:from_date],
              priceOverride: product_price[:price_override],
              type: product_price[:type],
              recurringPaymentRequired: product_price[:recurring_payment_required],
              eid: product_price[:eid]
            },
            priceRanges: {
              attributes: get_page_info(product_price[:price_ranges]),
              priceRanges: get_price_ranges(product_price)
            }
          }
        }
      end

      product_prices
    end

    # Returns [Array]  Price Ranges
    def get_price_ranges(product_price)
      price_ranges = []

      count = product_price[:price_ranges][:total_elements].to_i

      (0..count - 1).each do|i|
        price_range = product_price[:price_ranges][:priceranges][i]

        price_ranges << {
          priceRange: {
            quantityBeginRange: price_range[:quantity_begin_range],
            price: price_range[:price],
            level: price_range[:level],
            eid: price_range[:eid]
          }
        }
      end

      price_ranges
    end

    def get_page_info(category)
      {
        pageNumber: category[:page_number],
        pageSize: category[:page_size],
        totalElements: category[:total_elements],
        elementCount: category[:element_count],
        totalPages: category[:total_pages]
      }
    end

    def get_billing_account(billing_account)
      {
        attributes: {
          eid: billing_account[:eid]
        }
      }
    end

    def get_full_billing_account(billing_account)
      ba_details = {
        attributes: {
          accountNum: billing_account[:account_num],
          billType: billing_account[:bill_type],
          automaticRecurringPayment: billing_account[:automatic_recurring_payment],
          status: billing_account[:status],
          pendingChargesTotal: billing_account[:pending_charges_total],
          balance: billing_account[:balance],
          startDate: billing_account[:start_date],
          taxExempt: billing_account[:tax_exempt],
          eid: billing_account[:eid]
        }.delete_if{|k,v| v.nil?},
        dailyBillCycle: {
          name: billing_account[:daily_bill_cycle][:name],
          startDate: billing_account[:daily_bill_cycle][:start_date],
          endDate: billing_account[:daily_bill_cycle][:end_date],
          billCycleType: billing_account[:daily_bill_cycle][:bill_cycle_type],
          autoBill: billing_account[:daily_bill_cycle][:auto_bill],
          usePaymentTerm: billing_account[:daily_bill_cycle][:use_payment_term],
          status: billing_account[:daily_bill_cycle][:status],
          eid: billing_account[:daily_bill_cycle][:eid]
        }.delete_if{|k,v| v.nil?},
        person: {
          attributes: {
            firstName: billing_account[:person][:first_name],
            lastName: billing_account[:person][:last_name],
            eid: billing_account[:person][:eid]
          },
          addresses: get_addresses(billing_account[:person])
        }.delete_if{|k,v| v.nil?},
        billingAccountCategory: {
          type: billing_account[:billing_account_category][:type],
          description: billing_account[:billing_account_category][:description],
          status: billing_account[:billing_account_category][:status],
          eid: billing_account[:billing_account_category][:eid]
        }.delete_if{|k,v| v.nil?},
        paymentTerm: {
          name: billing_account[:payment_term][:name],
          termDays: billing_account[:payment_term][:term_days],
          graceDays: billing_account[:payment_term][:grace_days],
          eid: billing_account[:payment_term][:eid]
        }.delete_if{|k,v| v.nil?}
      }

      ba_details.delete_if{|k,v| v.nil?}
    end

    def get_addresses(entity)
      addresses = {
        attributes: {}
      }

      if entity[:addresses].has_key?(:email_address)
        email_address = {
          emailAddress: {
            purpose: entity[:addresses][:email_address][:purpose],
            email: entity[:addresses][:email_address][:email],
          }.delete_if{|k,v| v.nil?}
        }.delete_if{|k,v| v.nil?}

        addresses.merge! email_address if email_address.present?
      end
        
      if entity[:addresses].has_key?(:postal_address)
        postal_address = {
          postalAddress: {
            purpose: entity[:addresses][:postal_address][:purpose],
            country: entity[:addresses][:postal_address][:country],
            city: entity[:addresses][:postal_address][:city],
            regionOrState: entity[:addresses][:postal_address][:region_or_state],
            attention: entity[:addresses][:postal_address][:attention],
            postalCode: entity[:addresses][:postal_address][:postal_code],
            line1: entity[:addresses][:postal_address][:line1],
          }.delete_if{|k,v| v.nil?}
        }.delete_if{|k,v| v.nil?}

        addresses.merge! postal_address if postal_address.present?
      end

      if entity[:addresses].has_key?(:telecom_address)
        tele_address = {
          telecomAddress: {
            dialingPrefix: entity[:addresses].try(:[],:telecom_address).try(:[],:dialing_prefix),
            countryCode: entity[:addresses].try(:[],:telecom_address).try(:[],:country_code),
            areaCode: entity[:addresses].try(:[],:telecom_address).try(:[],:area_code),
            number: entity[:addresses].try(:[],:telecom_address).try(:[],:number),
            extension: entity[:addresses].try(:[],:telecom_address).try(:[],:extension),
            purpose: entity[:addresses].try(:[],:telecom_address).try(:[],:purpose),
            eid: entity[:addresses].try(:[],:telecom_address).try(:[],:eid) 
          }.delete_if{|k,v| v.nil?}
        }.delete_if{|k,v| v.nil?}

        addresses.merge! tele_address if tele_address.present?
      end

      addresses

    rescue
      {}
    end

  end
end
