module GoTransverseTractApi

  module Product

    class OperationAttribute

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self, {eid: eid})
      end

      #
      # @param {Long} product_order_item_eid
      #
      def self.find_by_product_order_item_eid product_order_item_eid
        GoTransverseTractApi.get_response_for(self, {product_order_item_eid: product_order_item_eid})
      end

    end

  end

end