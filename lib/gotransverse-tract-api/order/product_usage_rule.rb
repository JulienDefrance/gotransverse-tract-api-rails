module GoTransverseTractApi

  module Order

    class ProductUsageRule

      class << self

        #
        # @param {Long} product_price_eid
        # @param {String} query_scope
        #
        def find_by_product_price_eid product_price_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {productPriceEid: product_price_eid, queryScope: query_scope})
        end

        def get_product_usage_rules(product_usage_rules)
          product_usage_rule = {
            attributes: {},
            matchAllProductUsageRule: {
              attributes: {
                eid: product_usage_rule[:eid],
                limit: product_usage_rule[:limit],
                usageUom: product_usage_rule[:usage_uom],
                name: product_usage_rule[:name],
                order: product_usage_rule[:order],
                proratedOnOrder: product_usage_rule[:prorated_on_order],
                proratedOnCancel: product_usage_rule[:prorated_on_cancel],
                rollOverType: product_usage_rule[:roll_over_type],
                allowanceType: product_usage_rule[:allowance_type],
                validFrom: product_usage_rule[:valid_from],
                validTo: product_usage_rule[:valid_to],
                ruleType: product_usage_rule[:rule_type],
                status: product_usage_rule[:status],
                chargeCategory: product_usage_rule[:charge_category]
              }.delete_if{|k,v| v.nil?},
              usageRate: UsageRate.get_usage_rate(product_usage_rule[:usage_rate])
            }
          }

          product_usage_rule
        end
      end

    end

  end

end
