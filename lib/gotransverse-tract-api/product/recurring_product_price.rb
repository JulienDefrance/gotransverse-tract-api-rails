module GoTransverseTractApi

  module Product

    class RecurringProductPrice < ProductPrice

      class << self

        #
        # @param {Long} recurrence_period
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_recurrence_period recurrence_period, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {recurrence_period: recurrence_period, queryScope: query_scope})
        end

        #
        # @param {Long} recurrence_amount
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_recurrence_amount recurrence_amount, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {recurrence_amount: recurrence_amount, queryScope: query_scope})
        end

        #
        # @param {Boolean} recurring_payment_required
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_recurring_payment_required recurring_payment_required, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {recurring_payment_required: recurring_payment_required, queryScope: query_scope})
        end

        #
        # @param {Boolean} bill_in_advance
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_bill_in_advance bill_in_advance, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {bill_in_advance: bill_in_advance, queryScope: query_scope})
        end

        #
        # @param {Boolean} prorated_on_cancel
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_prorated_on_cancel prorated_on_cancel, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {prorated_on_cancel: prorated_on_cancel, queryScope: query_scope})
        end

        #
        # @param {Boolean} prorated_on_order
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_prorated_on_order prorated_on_order, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {prorated_on_order: prorated_on_order, queryScope: query_scope})
        end

        #
        # @param {Boolean} prorated_on_order_no_charge
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_prorated_on_order_no_charge prorated_on_order_no_charge, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {prorated_on_order_no_charge: prorated_on_order_no_charge, queryScope: query_scope})
        end

        #
        # @param {Hash} recurring_product_price
        #
        def get_recurring_product_price(recurring_product_price)
          if recurring_product_price.has_key?('price_ranges')
            price_ranges = Order::PriceRange.get_price_ranges(recurring_product_price[:price_ranges])
          end

          if recurring_product_price.has_key?('product_usage_rules')
            product_usage_rules = Usage::ProductUsageRule.get_product_usage_rule(recurring_product_price[:product_usage_rules])
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
