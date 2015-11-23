module GoTransverseTractApi

  module Product

    class ProductPriceRange

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self, {eid: eid})
      end

      #
      # @param {Long} product_eid
      #
      def self.find_by_product_eid product_eid
        GoTransverseTractApi.get_response_for(self, {product_eid: product_eid})
      end

      #
      # @param {Long} product_price_eid
      #
      def self.find_by_product_price_eid product_price_eid
        GoTransverseTractApi.get_response_for(self, {product_price_eid: product_price_eid})
      end

      #
      # @param {Long} price_list_eid
      #
      def self.find_by_price_list_eid price_list_eid
        GoTransverseTractApi.get_response_for(self, {price_list_eid: price_list_eid})
      end

      #
      # @param {Boolean} price_list_is_master
      #
      def self.find_by_price_list_is_master price_list_is_master
        GoTransverseTractApi.get_response_for(self, {price_list_is_master: price_list_is_master})
      end

      #
      # @param {String} currency_type
      #
      def self.find_by_currency_type currency_type
        GoTransverseTractApi.get_response_for(self, {currency_type: currency_type})
      end

    end

  end

end

