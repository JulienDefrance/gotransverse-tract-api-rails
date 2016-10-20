module GoTransverseTractApi

  module Product

    class OperationAttribute

      #
      # @param {Long} eid
      # @param {Hash} options
      #
      def self.find_by_eid(eid, options={})
        return nil unless eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} product_order_item_eid
      # @param {Hash} options
      #
      def self.find_by_product_order_item_eid(product_order_item_eid, options={})
        return nil unless product_order_item_eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_order_item_eid: product_order_item_eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      # TODO: add specs
      #
      # @param {Hash} operation_attributes
      #
      def self.get_operation_attributes(operation_attributes={})
        return nil unless operation_attributes.has_key?(:product_sale_operation_attribute) && operation_attributes.has_key?(:approval_operation)

        operation_details = {
            attributes: {},
            productSaleOperationAttribute: {
                attributes: {autoApproveDate: operation_attributes[:product_sale_operation_attribute][:auto_approve_date]},
                approvalOperation: {
                    attributes: {eid: operation_attributes[:approval_operation][:eid]}
                }
            }
        }

        operation_details
      end

    end

  end

end
