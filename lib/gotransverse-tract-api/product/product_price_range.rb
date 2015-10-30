module GoTransverseTractApi

  module Product

    class ProductPriceRange

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self.class, {eid: eid})
      end

      #
      # @param {Long} product_eid
      #
      def self.find_by_product_eid product_eid
        GoTransverseTractApi.get_response_for(self.class, {product_eid: product_eid})
      end

      #
      # @param {Long} product_price_eid
      #
      def self.find_by_product_price_eid product_price_eid
        GoTransverseTractApi.get_response_for(self.class, {product_price_eid: product_price_eid})
      end

      #
      # @param {Long} price_list_eid
      #
      def self.find_by_price_list_eid price_list_eid
        GoTransverseTractApi.get_response_for(self.class, {price_list_eid: price_list_eid})
      end

      #
      # @param {Boolean} price_list_is_master
      #
      def self.find_by_price_list_is_master price_list_is_master
        GoTransverseTractApi.get_response_for(self.class, {price_list_is_master: price_list_is_master})
      end

    end

  end

end

