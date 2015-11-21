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
      # @param {Nokogiri::XML::Document} approve
      #
      def self.approve eid, approve
        GoTransverseTractApi.post_request_for(self, {eid: eid}, approve.to_s, "approve")
      end

      #
      # @param {Long} eid
      # @param {Nokogiri::XML::Document} deny
      #
      def self.deny eid, deny
        GoTransverseTractApi.post_request_for(self, {eid: eid}, deny.to_s, "deny")
      end

    end

  end

end
