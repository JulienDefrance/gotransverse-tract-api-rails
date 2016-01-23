module GoTransverseTractApi

  module Order

    class OrderItemUsageRule

      class << self
        def get_order_item_usage_rule(order_item_usage_rule)
          if order_item_usage_rule.has_key?(:match_all_order_item_usage_rule)
            if order_item_usage_rule[:match_all_order_item_usage_rule].has_key?(:usage_rate)
              usage_rate = UsageRate.get_usage_rate(order_item_usage_rule[:match_all_order_item_usage_rule][:usage_rate])
            end
          end 

          order_item_usage_rules = {
            attributes: {},
            matchAllOrderItemUsageRule: {
              attributes: {
                eid: order_item_usage_rule[:match_all_order_item_usage_rule][:eid],
                limit: order_item_usage_rule[:match_all_order_item_usage_rule][:limit],
                usageUom: order_item_usage_rule[:match_all_order_item_usage_rule][:usage_uom],
                name: order_item_usage_rule[:match_all_order_item_usage_rule][:name],
                order: order_item_usage_rule[:match_all_order_item_usage_rule][:order],
                proratedOnOrder: order_item_usage_rule[:match_all_order_item_usage_rule][:prorated_on_order],
                proratedOnCancel: order_item_usage_rule[:match_all_order_item_usage_rule][:prorated_on_cancel],
                rollOverType: order_item_usage_rule[:match_all_order_item_usage_rule][:roll_over_type],
                allowanceType: order_item_usage_rule[:match_all_order_item_usage_rule][:allowance_type],
                validFrom: order_item_usage_rule[:match_all_order_item_usage_rule][:valid_from],
                validTo: order_item_usage_rule[:match_all_order_item_usage_rule][:valid_to],
                ruleType: order_item_usage_rule[:match_all_order_item_usage_rule][:rule_type],
                status: order_item_usage_rule[:match_all_order_item_usage_rule][:status],
                chargeCategory: order_item_usage_rule[:match_all_order_item_usage_rule][:charge_category]
              }.delete_if{|k,v| v.nil?},
              matchAllProductUsageRule: {
                eid: order_item_usage_rule[:match_all_order_item_usage_rule][:match_all_product_usage_rule][:eid]
              },
              usageRate: usage_rate
            }
          }

          order_item_usage_rules.delete_if{|k,v| v.nil?}
        end
      end

    end

  end

end
