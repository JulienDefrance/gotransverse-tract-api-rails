module GoTransverseTractApi

  module Product

    class ProductSaleOperationAttributes

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
      # @param {Long} eid
      # @param {Hash} product_sale_operation_attributes
      #
      def self.update(eid, product_sale_operation_attributes)
        data = {
            productSaleOperationAttribute: {
                autoApproveDate: product_sale_operation_attributes[:product_sale_operation_attribute][:auto_approve_date],
                eid: eid
            },
            approvalOperation: {attributes: {eid: product_sale_operation_attributes[:approval_operation][:eid]}}
        }

        xml_data = GoTransverseTractApi.generateXML(data, 'productSaleOperationAttribute')
        GoTransverseTractApi.put_request_for(self, {eid: eid}, xml_data)
      end

    end
  end
end