module GoTransverseTractApi

  module Order

    class RecurringProductPrice

      class << self
        def get_recurring_product_price(recurring_product_price)
          if recurring_product_price.has_key?('price_ranges')
            price_ranges = PriceRange.get_price_ranges(recurring_product_price[:price_ranges])
          end

          if recurring_product_price.has_key?('product_usage_rules')
            product_usage_rules = ProductUsageRule.get_product_usage_rule(recurring_product_price[:product_usage_rules])
          end

          recurringProductPrice = {
            attributes: {
              fromDate: recurring_product_price[:from_date],
              priceOverride: recurring_product_price[:price_override],
              type: recurring_product_price[:type],
              paymentOnPurchaseRequired: recurring_product_price[:payment_on_purchase_required],
              recurringPaymentRequired: recurring_product_price[:recurring_payment_required],
              recurrencePeriod: recurring_product_price[:recurrence_period],
              recurrenceAmount: recurring_product_price[:recurrence_amount],
              allowScheduledCharges: recurring_product_price[:allow_scheduled_charges],
              currencyType: recurring_product_price[:currency_type],
              proratedOnOrder: recurring_product_price[:prorated_on_order],
              proratedOnCancel: recurring_product_price[:prorated_on_cancel],
              proratedOnOrderNoCharge: recurring_product_price[:prorated_on_order_no_charge],
              billInAdvance: recurring_product_price[:bill_in_advance],
              eid: recurring_product_price[:eid]
            }.delete_if{|k,v| v.nil?},
            priceRanges: price_ranges,
            productUsageRules: product_usage_rules
          }

          recurringProductPrice.delete_if{|k,v| v.nil?} 
        end
      end

    end

  end

end


