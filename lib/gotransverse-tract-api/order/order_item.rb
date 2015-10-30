module GoTransverseTractApi

  module Order

    class OrderItem

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self.class, {eid: eid})
      end

      #
      # @param {Long} order_eid
      #
      def self.find_by_order_eid order_eid
        GoTransverseTractApi.get_response_for(self.class, {order_eid: order_eid})
      end

      #
      # @param {String} order_num
      #
      def self.find_by_order_num order_num
        GoTransverseTractApi.get_response_for(self.class, {order_num: order_num})
      end

      #
      # @param {Long} product_eid
      #
      def self.find_by_product_eid product_eid
        GoTransverseTractApi.get_response_for(self.class, {product_eid: product_eid})
      end

      #
      # @param {Long} parent_order_item_eid
      #
      def self.find_by_parent_order_item_eid parent_order_item_eid
        GoTransverseTractApi.get_response_for(self.class, {parent_order_item_eid: parent_order_item_eid})
      end

      #
      # @param {String} service_identifier
      #
      def self.find_by_service_identifier service_identifier
        GoTransverseTractApi.get_response_for(self.class, {service_identifier: service_identifier})
      end

    end

  end

end
