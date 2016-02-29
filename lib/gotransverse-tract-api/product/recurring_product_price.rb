module GoTransverseTractApi

  module Product

    class RecurringProductPrice < ProductPrice

      class << self

        #
        # @param {Long} recurrence_period
        # @param {Hash} options
        #
        def find_by_recurrence_period recurrence_period, options=nil
          return nil unless recurrence_period.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({recurrence_period: recurrence_period}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} recurrence_amount
        # @param {Hash} options
        #
        def find_by_recurrence_amount recurrence_amount, options=nil
          return nil unless recurrence_amount.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({recurrence_amount: recurrence_amount}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Boolean} recurring_payment_required
        # @param {Hash} options
        #
        def find_by_recurring_payment_required recurring_payment_required, options=nil
          return nil unless recurring_payment_required.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({recurring_payment_required: recurring_payment_required}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Boolean} bill_in_advance
        # @param {Hash} options
        #
        def find_by_bill_in_advance bill_in_advance, options=nil
          return nil unless bill_in_advance.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({bill_in_advance: bill_in_advance}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Boolean} prorated_on_cancel
        # @param {Hash} options
        #
        def find_by_prorated_on_cancel prorated_on_cancel, options=nil
          return nil unless prorated_on_cancel.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({prorated_on_cancel: prorated_on_cancel}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Boolean} prorated_on_order
        # @param {Hash} options
        #
        def find_by_prorated_on_order prorated_on_order, options=nil
          return nil unless prorated_on_order.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({prorated_on_order: prorated_on_order}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Boolean} prorated_on_order_no_charge
        # @param {Hash} options
        #
        def find_by_prorated_on_order_no_charge prorated_on_order_no_charge, options=nil
          return nil unless prorated_on_order_no_charge.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({prorated_on_order_no_charge: prorated_on_order_no_charge}, options)
          GoTransverseTractApi.get_response_for(self, params)
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
