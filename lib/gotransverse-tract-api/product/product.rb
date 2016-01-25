module GoTransverseTractApi

  module Product

    class Product

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
        # @param {String} name
        #
        def find_by_name name
          GoTransverseTractApi.get_response_for(self, {name: name})
        end

        #
        # @param {String} internal_name
        #
        def find_by_internal_name internal_name
          GoTransverseTractApi.get_response_for(self, {internal_name: internal_name})
        end

        #
        # @param {String} external_product_number
        #
        def find_by_external_product_number external_product_number
          GoTransverseTractApi.get_response_for(self, {external_product_number: external_product_number})
        end

        #
        # @param {String} sku
        #
        def find_by_sku sku
          GoTransverseTractApi.get_response_for(self, {sku: sku})
        end

        #
        # @param {String} product_type_code
        #
        def find_by_product_type_code product_type_code
          GoTransverseTractApi.get_response_for(self, {product_type_code: product_type_code})
        end

        #
        # @param {String} product_state
        #
        def find_by_product_state product_state
          GoTransverseTractApi.get_response_for(self, {product_state: product_state})
        end

        #
        # @param {Long} service_resource_category_eid
        #
        def find_by_service_resource_category_eid service_resource_category_eid
          GoTransverseTractApi.get_response_for(self, {service_resource_category_eid: service_resource_category_eid})
        end

        #
        # @param {String} service_resource_category_name
        #
        def find_by_service_resource_category_name service_resource_category_name
          GoTransverseTractApi.get_response_for(self, {service_resource_category_name: service_resource_category_name})
        end

        #
        # @param {Long} product_category_eid
        #
        def find_by_product_category_eid product_category_eid
          GoTransverseTractApi.get_response_for(self, {product_category_eid: product_category_eid})
        end

        #
        # @param {String} product_category_name
        #
        def find_by_product_category_name product_category_name
          GoTransverseTractApi.get_response_for(self, {product_category_name: product_category_name})
        end

        #
        # @param {Long} price_list_eid
        #
        def find_by_price_list_eid price_list_eid
          GoTransverseTractApi.get_response_for(self, {price_list_eid: price_list_eid})
        end

        #
        # @param {Boolean} price_list_is_master
        #
        def find_by_price_list_is_master price_list_is_master
          GoTransverseTractApi.get_response_for(self, {price_list_is_master: price_list_is_master})
        end

        #
        # @param {String} currency_type
        #
        def find_by_currency_type currency_type
          GoTransverseTractApi.get_response_for(self, {currency_type: currency_type})
        end

        #
        # @param {Long} product_tag_eid
        #
        def find_by_product_tag_eid product_tag_eid
          GoTransverseTractApi.get_response_for(self, {product_tag_eid: product_tag_eid})
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

