module GoTransverseTractApi

  module Product

    class Product

      class << self

        def find_all
          GoTransverseTractApi.get_response_for(self)
        end

        #
        # @param {Long} eid
        # @param {String} query_scope
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {String} name
        # @param {String} query_scope
        #
        def find_by_name name, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {name: name, queryScope: query_scope})
        end

        #
        # @param {String} internal_name
        # @param {String} query_scope
        #
        def find_by_internal_name internal_name, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {internal_name: internal_name, queryScope: query_scope})
        end

        #
        # @param {String} external_product_number
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_external_product_number external_product_number, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {external_product_number: external_product_number, queryScope: query_scope})
        end

        #
        # @param {String} sku
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_sku sku, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {sku: sku, queryScope: query_scope})
        end

        #
        # @param {String} product_type_code
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_product_type_code product_type_code, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {product_type_code: product_type_code, queryScope: query_scope})
        end

        #
        # @param {String} product_state
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_product_state product_state, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {product_state: product_state, queryScope: query_scope})
        end

        #
        # @param {Long} service_resource_category_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_service_resource_category_eid service_resource_category_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {service_resource_category_eid: service_resource_category_eid, queryScope: query_scope})
        end

        #
        # @param {String} service_resource_category_name
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_service_resource_category_name service_resource_category_name, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {service_resource_category_name: service_resource_category_name, queryScope: query_scope})
        end

        #
        # @param {Long} product_category_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_product_category_eid product_category_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {product_category_eid: product_category_eid, queryScope: query_scope})
        end

        #
        # @param {String} product_category_name
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_product_category_name product_category_name, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {product_category_name: product_category_name, queryScope: query_scope})
        end

        #
        # @param {Long} price_list_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_price_list_eid price_list_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {price_list_eid: price_list_eid, queryScope: query_scope})
        end

        #
        # @param {Boolean} price_list_is_master
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_price_list_is_master price_list_is_master, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {price_list_is_master: price_list_is_master, queryScope: query_scope})
        end

        #
        # @param {String} currency_type
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_currency_type currency_type, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {currency_type: currency_type, queryScope: query_scope})
        end

        #
        # @param {Long} product_tag_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_product_tag_eid product_tag_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {product_tag_eid: product_tag_eid, queryScope: query_scope})
        end

        #
        # @param {Hash} product
        #
        def get_product_info product
          if product.has_key?(:product_prices)
            product_prices = Order::RecurringProductPrice.get_recurring_product_price(product[:product_prices])
          end

          if product.has_key?(:product_category)
            product_category = ProductCategory.get_product_category(product[:product_category])
          end

          if product.has_key?(:service_resource_category)
            svc_resource_category = ServiceResourceCategory.get_service_resource_category(product[:service_resource_category])
          end

          if product.has_key?(:product_usage_rules)
            product_usage_rules = Order::ProductUsageRule.get_product_usage_rule(product[:product_usage_rules])
          end

          product_info = {
            attributes: {
              name: product[:name],
              description: product[:description],
              shortDescription: product[:short_description],
              productTypeCode: product[:product_type_code],
              productState: product[:product_state],
              requiresAgreement: product[:requires_agreement],
              serialized: product[:serialized],
              taxable: product[:taxable],
              trial: product[:trial],
              defaultQuantity: product[:default_quantity],
              internalName: product[:internal_name],
              minServiceResources: product[:min_service_resources],
              maxServiceResources: product[:max_service_resources],
              trialOverride: product[:trial_override],
              eid: product[:eid]
            }.delete_if{|k,v| v.nil?},
            productPrices: product_prices,
            productCategory: product_category,
            serviceResourceCategory: svc_resource_category, 
            productUsageRules: product_usage_rules
          }

          product_info.delete_if{|k,v| v.nil?}
        end
      end
      
    end

  end

end

