module GoTransverseTractApi

  module Product

    class OperationAttribute

      #
      # @param {Long} eid
      # @param {Hash} options
      #
      def self.find_by_eid eid, options={}
        return nil unless eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} product_order_item_eid
      # @param {Hash} options
      #
      def self.find_by_product_order_item_eid product_order_item_eid, options={}
        return nil unless product_order_item_eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_order_item_eid: product_order_item_eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

    end

  end

end
