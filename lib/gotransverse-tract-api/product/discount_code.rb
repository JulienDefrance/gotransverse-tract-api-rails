module GoTransverseTractApi

  module Product

    class DiscountCode < DiscountCategory

      #
      # @param {Long} discount_charge_category_eid
      #
      def self.find_by_discount_charge_category_eid discount_charge_category_eid
        GoTransverseTractApi.get_response_for(self, {discount_charge_category_eid: discount_charge_category_eid})
      end

      #
      # @param {DateTime} valid_from
      #
      def self.find_by_valid_from valid_from
        GoTransverseTractApi.get_response_for(self, {valid_from: valid_from})
      end

      #
      # @param {DateTime} valid_to
      #
      def self.find_by_valid_to valid_to
        GoTransverseTractApi.get_response_for(self, {valid_to: valid_to})
      end

      #
      # @param {Long} discount_eid
      #
      def self.find_by_discount_eid discount_eid
        GoTransverseTractApi.get_response_for(self, {discount_eid: discount_eid})
      end

      #
      # @param {Long} discount_identifier
      #
      def self.find_by_discount_identifier discount_identifier
        GoTransverseTractApi.get_response_for(self, {discount_identifier: discount_identifier})
      end

      #
      # @param {Long} discount_identifier_eid
      #
      def self.find_by_discount_identifier_eid discount_identifier_eid
        GoTransverseTractApi.get_response_for(self, {discount_identifier_eid: discount_identifier_eid})
      end

      #
      # @param {Long} price_list_eid
      #
      def self.find_by_price_list_eid price_list_eid
        GoTransverseTractApi.get_response_for(self, {price_list_eid: price_list_eid})
      end

      #
      # @param {String} price_list_is_master
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

      #
      # @param {Long} product_eid
      #
      def self.find_by_product_eid product_eid
        GoTransverseTractApi.get_response_for(self, {product_eid: product_eid})
      end

    end

  end

end
