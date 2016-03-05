module GoTransverseTractApi

  module Usage

    class ProductUsageRule

      class << self

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
        # @param {Long} product_eid
        # @param {Hash} options
        #
        def find_by_product_eid product_eid, options={}
          return nil unless product_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_eid: product_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} product_price_eid
        # @param {Hash} options
        #
        def find_by_product_price_eid product_price_eid, options={}
          return nil unless product_price_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_price_eid: product_price_eid}, options)
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
        # @param {Hash} product_usage_rules
        #
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
