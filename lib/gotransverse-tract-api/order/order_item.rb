module GoTransverseTractApi

  module Order

    class OrderItem

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self, {eid: eid})
      end

      #
      # @param {Long} order_eid
      #
      def self.find_by_order_eid order_eid
        GoTransverseTractApi.get_response_for(self, {order_eid: order_eid})
      end

      #
      # @param {String} order_num
      #
      def self.find_by_order_num order_num
        GoTransverseTractApi.get_response_for(self, {order_num: order_num})
      end

      #
      # @param {Long} product_eid
      #
      def self.find_by_product_eid product_eid
        GoTransverseTractApi.get_response_for(self, {product_eid: product_eid})
      end

      #
      # @param {Long} parent_order_item_eid
      #
      def self.find_by_parent_order_item_eid parent_order_item_eid
        GoTransverseTractApi.get_response_for(self, {parent_order_item_eid: parent_order_item_eid})
      end

      #
      # @param {String} service_identifier
      #
      def self.find_by_service_identifier service_identifier
        GoTransverseTractApi.get_response_for(self, {service_identifier: service_identifier})
      end

      #
      # @param {Long} service_eid
      #
      def self.find_by_service_eid service_eid
        GoTransverseTractApi.get_response_for(self, {service_eid: service_eid})
      end

      #
      # @param {String} discount_identifier
      #
      def self.find_by_discount_identifier discount_identifier
        GoTransverseTractApi.get_response_for(self, {discount_identifier: discount_identifier})
      end

      #
      # @param {Long} eid
      # @param {Hash} order_item
      #
      def self.approve eid, order_item
        data = {
          :approveOrderItem => {
            :approvalDate => order_item[:approval_date],
          },
          :orderItem => {
            :attributes => {
              :xsitype => order_item[:type],
              :awaitingApproval => order_item[:awaiting_approval],
              :requestedEffectiveDate => order_item[:requested_effective_date],
              :unitPrice => order_item[:unit_price],
              :recurringUnitPrice => order_item[:recurring_unit_price],
              :quantity => order_item[:quantity],
              :sequence => order_item[:sequence],
              :approvalDate => order_item[:date_approval],
              :description => order_item[:description],
              eid: eid
            },
            :orderItems => {
              :pageNumber => order_item[:order_items][:page_number],
              :pageSize => order_item[:order_items][:page_size],
              :totalElements => order_item[:order_items][:total_elements],
              :elementCount => order_item[:order_items][:element_count],
              :totalPages => order_item[:order_items][:total_pages]
            },
            :orderItemUsageRules => {
              :pageNumber => order_item[:order_item_usage_rules][:page_number],
              :pageNumber => order_item[:order_item_usage_rules][:page_number],
              :totalElements => order_item[:order_item_usage_rules][:total_elements],
              :elementCount => order_item[:order_item_usage_rules][:element_count],
              :totalPages => order_item[:order_item_usage_rules][:total_pages]
            },
            :recurringProductPrice => {
              :attributes => {
                :fromDate => order_item[:recurring_product_price][:from_date],
                :priceOverride => order_item[:recurring_product_price][:price_override],
                :type => order_item[:recurring_product_price][:type],
                :paymentOnPurchaseRequired => order_item[:recurring_product_price][:payment_on_purchase_required],
                :recurringPaymentRequired => order_item[:recurring_product_price][:recurring_payment_required],
                :recurrencePeriod => order_item[:recurring_product_price][:recurrence_period],
                eid: order_item[:recurring_product_price][:eid]
              },
              :priceRanges => {
                :attributes => {
                  :pageNumber => order_item[:recurring_product_price][:price_ranges][:page_number],
                  :pageSize => order_item[:recurring_product_price][:price_ranges][:page_size],
                  :totalElements => order_item[:recurring_product_price][:price_ranges][:total_elements],
                  :elementCount => order_item[:recurring_product_price][:price_ranges][:element_count],
                  :totalPages => order_item[:recurring_product_price][:price_ranges][:total_pages]
                },
                :priceRange => {
                  :quantityBeginRange => order_item[:recurring_product_price][:price_ranges][:price_range][:quantity_begin_range],
                  :price => order_item[:recurring_product_price][:price_ranges][:price_range][:price],
                  :level => order_item[:recurring_product_price][:price_ranges][:price_range][:level],
                  eid: order_item[:recurring_product_price][:price_ranges][:price_range][:eid]
                }
              }
            },
            :product => {
              :attributes => {
                :name => order_item[:product][:name],
                :description => order_item[:product][:description],
                :shortDescription => order_item[:product][:short_description],
                :productTypeCode => order_item[:product][:product_type_code],
                :productState => order_item[:product][:product_state],
                :requiresAgreement => order_item[:product][:requires_agreement],
                :serialized => order_item[:product][:serialized],
                :taxable => order_item[:product][:taxable],
                :trial => order_item[:product][:trial],
                :defaultQuantity => order_item[:product][:default_quantity],
                :internalName => order_item[:product][:internal_name],
                :minServiceResources => order_item[:product][:min_service_resources],
                :maxServiceResources => order_item[:product][:max_service_resources],
                :trialOverride => order_item[:product][:trial_override],
                eid: order_item[:product][:eid]
              },
              :productPrices => {
                :attributes => {
                  :pageNumber => order_item[:product][:product_prices][:page_number],
                  :pageSize => order_item[:product][:product_prices][:page_size],
                  :totalElements => order_item[:product][:product_prices][:total_elements],
                  :elementCount => order_item[:product][:product_prices][:element_count],
                  :totalPages => order_item[:product][:product_prices][:total_pages]
                },
                :productPrice => {
                  :attributes => {
                    :fromDate => order_item[:product][:product_prices][:product_price][:from_date],
                    :priceOverride => order_item[:product][:product_prices][:product_price][:price_override],
                    :type => order_item[:product][:product_prices][:product_price][:type],
                    :paymentOnPurchaseRequired => order_item[:product][:product_prices][:product_price][:payment_on_purchase_required],
                    :recurringPaymentRequired => order_item[:product][:product_prices][:product_price][:recurring_payment_required],
                    :recurrencePeriod => order_item[:product][:product_prices][:product_price][:recurrence_period],
                    eid: order_item[:product][:product_prices][:product_price][:eid]
                  },
                  :priceRanges => {
                    :attributes => {
                      :pageNumber => order_item[:product][:product_prices][:product_price][:price_ranges][:page_number],
                      :pageSize => order_item[:product][:product_prices][:product_price][:price_ranges][:page_size],
                      :totalElements => order_item[:product][:product_prices][:product_price][:price_ranges][:total_elements],
                      :elementCount => order_item[:product][:product_prices][:product_price][:price_ranges][:element_count],
                      :totalPages => order_item[:product][:product_prices][:product_price][:price_ranges][:total_pages]
                    },
                    :priceRange => {
                      :quantityBeginRange => order_item[:product][:product_prices][:product_price][:price_ranges][:price_range][:quantity_begin_range],
                      :price => order_item[:product][:product_prices][:product_price][:price_ranges][:price_range][:price],
                      :level => order_item[:product][:product_prices][:product_price][:price_ranges][:price_range][:level],
                      eid: order_item[:product][:product_prices][:product_price][:price_ranges][:price_range][:eid]
                    }
                  }
                }
              },
              :productCategory => {
                :name => order_item[:product][:product_category][:name],
                :description => order_item[:product][:product_category][:description],
                :status => order_item[:product][:product_category][:status],
                eid: order_item[:product][:product_category][:eid]
              },
              :serviceResourceCategory => {
                :name => order_item[:product][:service_resource_category][:name],
                :type => order_item[:product][:service_resource_category][:type],
                :status => order_item[:product][:service_resource_category][:status],
                eid: order_item[:product][:service_resource_category][:eid]
              },
              :actions => {
                :pageNumber => order_item[:product][:actions][:page_number],
                :pageSize => order_item[:product][:actions][:page_size],
                :totalElements => order_item[:product][:actions][:total_elements],
                :elementCount => order_item[:product][:actions][:element_count],
                :totalPages => order_item[:product][:actions][:total_pages]
              },
              :productUsageRules => {
                :pageNumber => order_item[:product][:product_usage_rules][:page_number],
                :pageNumber => order_item[:product][:product_usage_rules][:page_number],
                :totalElements => order_item[:product][:product_usage_rules][:total_elements],
                :elementCount => order_item[:product][:product_usage_rules][:element_count],
                :totalPages => order_item[:product][:product_usage_rules][:total_pages]
              }
            },
            :priceList => {
              :name => order_item[:price_list][:name],
              eid: order_item[:price_list][:eid]
            },
            :serviceResources => {
              :pageNumber => order_item[:service_resources][:page_number],
              :pageNumber => order_item[:service_resources][:page_number],
              :totalElements => order_item[:service_resources][:total_elements],
              :elementCount => order_item[:service_resources][:element_count],
              :totalPages => order_item[:service_resources][:total_pages]
            },
            :operationAttributes => {
              :pageNumber => order_item[:operation_attributes][:page_number],
              :pageNumber => order_item[:operation_attributes][:page_number],
              :totalElements => order_item[:operation_attributes][:total_elements],
              :elementCount => order_item[:operation_attributes][:element_count],
              :totalPages => order_item[:operation_attributes][:total_pages]
            },
            :scheduledCharges => {
              :pageNumber => order_item[:scheduled_charges][:page_number],
              :pageNumber => order_item[:scheduled_charges][:page_number],
              :totalElements => order_item[:scheduled_charges][:total_elements],
              :elementCount => order_item[:scheduled_charges][:element_count],
              :totalPages => order_item[:scheduled_charges][:total_pages]
            }
          }
        }

        xml_data = GoTransverseTractApi.generateXML(data, 'approveOrderItem')
        GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "approve")
      end

      #
      # @param {Long} eid
      # @param {Hash} orderitem
      #
      def self.deny eid, orderitem
        data = {
          :denyOrderItem => {},
          :orderItem => {eid: eid}
        }

        xml_data = GoTransverseTractApi.generateXML(data, 'denyOrderItem')
        GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "deny")
      end

    end

  end

end
