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

      if billing_account
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
          orderItem: get_order_items(sales_order[:order_items][:order_item])
        },
        billingAccount: get_billing_account(sales_order[:billing_account])
      }

      so_details
    end

    #
    # @param {Array} order_items
    #
    # Returns an Array of order item structure
    #
    def get_order_items(order_items)
      order_item_struct = []

      if order_items.is_a?(Hash)
        return Order::OrderItem.get_order_item(order_items)
      end

      order_items.each do|item|
        order_item_struct << {
          orderItem: Order::OrderItem.get_order_item(item)
        }
      end
      
      order_item_struct
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
        },
        dailyBillCycle: {
          name: billing_account[:daily_bill_cycle][:name],
          startDate: billing_account[:daily_bill_cycle][:start_date],
          endDate: billing_account[:daily_bill_cycle][:end_date],
          billCycleType: billing_account[:daily_bill_cycle][:bill_cycle_type],
          autoBill: billing_account[:daily_bill_cycle][:auto_bill],
          usePaymentTerm: billing_account[:daily_bill_cycle][:use_payment_term],
          status: billing_account[:daily_bill_cycle][:status],
          eid: billing_account[:daily_bill_cycle][:eid]
        },
        person: {
          attributes: {
            firstName: billing_account[:person][:first_name],
            lastName: billing_account[:person][:last_name],
            eid: billing_account[:person][:eid]
          },
          addresses: get_addresses(billing_account[:person])
        },
        billingAccountCategory: {
          type: billing_account[:billing_account_category][:type],
          description: billing_account[:billing_account_category][:description],
          status: billing_account[:billing_account_category][:status],
          eid: billing_account[:billing_account_category][:eid]
        },
        paymentTerm: {
          name: billing_account[:payment_term][:name],
          termDays: billing_account[:payment_term][:term_days],
          graceDays: billing_account[:payment_term][:grace_days],
          eid: billing_account[:payment_term][:eid]
        }
      }

      compact ba_details
    end

    def get_query_params(params, options={})
      if options.present? && options.is_a?(Hash)
        params.merge!(options) 
      end

      params
    end

    def get_addresses(entity)
      addresses = {
        attributes: {}
      }

      if entity[:addresses].has_key?(:email_address)
        email_address = get_email_address(entity[:addresses][:email_address])
        addresses.merge! email_address if email_address.present?
      end

      if entity[:addresses].has_key?(:postal_address)
        postal_address = get_postal_address(entity[:addresses][:postal_address])
        addresses.merge! postal_address if postal_address.present?
      end

      if entity[:addresses].has_key?(:telecom_address)
        tele_address = get_telecom_address(entity[:addresses][:telecom_address])
        addresses.merge! tele_address if tele_address.present?
      end

      compact addresses

    rescue
      {}
    end

    # Returns {Hash} Postal Address
    def get_postal_address(entity)
      postal_address = {
        postalAddress: {
          purpose: entity[:purpose],
          country: entity[:country],
          city: entity[:city],
          regionOrState: entity[:region_or_state],
          attention: entity[:attention],
          postalCode: entity[:postal_code],
          line1: entity[:line1]
        }
      }

      compact postal_address
    end

    # Returns {Hash} Email Address
    def get_email_address(entity)
      email_address = {
        emailAddress: {
          purpose: entity[:purpose],
          email: entity[:email]
        }
      }

      compact email_address
    end

    # Returns {Hash} Telecom Address
    def get_telecom_address(entity)
      tele_address = {
        telecomAddress: {
          dialingPrefix: entity.try(:[],:dialing_prefix),
          countryCode: entity.try(:[],:country_code),
          areaCode: entity.try(:[],:area_code),
          number: entity.try(:[],:number),
          extension: entity.try(:[],:extension),
          purpose: entity.try(:[],:purpose),
          eid: entity.try(:[],:eid) 
        }
      }

      compact tele_address
    end

    # Remove all nil elements from hash
    def compact(h={})
      h.each do|k,v|
        if v.nil?
          h.delete(k)
        elsif (v.is_a?(Hash) && v.empty?)
          next
        end

        compact v if v.is_a?Hash
      end

      # Remove all empty hashes except first key if it is empty
      # since that is required for XML root element attributes
      h.delete_if do|k,v|
        v.is_a?(Hash) && v.empty? && k != h.keys[0]
      end

      h
    end

  end
end
