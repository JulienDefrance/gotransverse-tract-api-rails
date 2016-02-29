module GoTransverseTractApi

  module Product

    class Product

      class << self

        #
        # @param {Hash} options
        #
        def find_all options=nil
          params ||= GoTransverseTractApi::ApiData.new.get_query_params({}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} eid
        # @param {Hash} options
        #
        def find_by_eid eid, options=nil
          return nil unless eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} name
        # @param {Hash} options
        #
        def find_by_name name, option=nil
          return nil unless name.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({name: name}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} internal_name
        # @param {Hash} options
        #
        def find_by_internal_name internal_name, options=nil
          return nil unless internal_name.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({internal_name: internal_name}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} external_product_number
        # @param {Hash} options
        #
        def find_by_external_product_number external_product_number, options=nil
          return nil unless external_product_number.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({external_product_number: external_product_number}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} sku
        # @param {Hash} options
        #
        def find_by_sku sku, options=nil
          return nil unless sku.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({sku: sku}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} product_type_code
        # @param {Hash} options
        #
        def find_by_product_type_code product_type_code, options=nil
          return nil unless product_type_code.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_type_code: product_type_code}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} product_state
        # @param {Hash} options
        #
        def find_by_product_state product_state, options=nil
          return nil unless product_state.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_state: product_state}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} service_resource_category_eid
        # @param {Hash} options
        #
        def find_by_service_resource_category_eid service_resource_category_eid, options=nil
          return nil unless service_resource_category_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({service_resource_category_eid: service_resource_category_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} service_resource_category_name
        # @param {Hash} options
        #
        def find_by_service_resource_category_name service_resource_category_name, options=nil
          return nil unless service_resource_category_name.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({service_resource_category_name: service_resource_category_name}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} product_category_eid
        # @param {Hash} options
        #
        def find_by_product_category_eid product_category_eid, options=nil
          return nil unless product_category_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_category_eid: product_category_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} product_category_name
        # @param {Hash} options
        #
        def find_by_product_category_name product_category_name, options=nil
          return nil unless product_category_name.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_category_name: product_category_name}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} price_list_eid
        # @param {Hash} options
        #
        def find_by_price_list_eid price_list_eid, options=nil
          return nil unless price_list_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({price_list_eid: price_list_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Boolean} price_list_is_master
        # @param {Hash} options
        #
        def find_by_price_list_is_master price_list_is_master, options=nil
          return nil unless price_list_is_master.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({price_list_is_master: price_list_is_master}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} currency_type
        # @param {Hash} options
        #
        def find_by_currency_type currency_type, options=nil
          return nil unless currency_type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({currency_type: currency_type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} product_tag_eid
        # @param {Hash} options
        #
        def find_by_product_tag_eid product_tag_eid, options=nil
          return nil unless product_tag_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_tag_eid: product_tag_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
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
            product_usage_rules = Usage::ProductUsageRule.get_product_usage_rule(product[:product_usage_rules])
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

