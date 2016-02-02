module GoTransverseTractApi

  module Product

    class DiscountCode < DiscountCategory

      #
      # @param {Long} discount_charge_category_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_discount_charge_category_eid discount_charge_category_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {discount_charge_category_eid: discount_charge_category_eid, queryScope: query_scope})
      end

      #
      # @param {DateTime} valid_from
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_valid_from valid_from, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {valid_from: valid_from, queryScope: query_scope})
      end

      #
      # @param {DateTime} valid_to
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_valid_to valid_to, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {valid_to: valid_to, queryScope: query_scope})
      end

      #
      # @param {Long} discount_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_discount_eid discount_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {discount_eid: discount_eid, queryScope: query_scope})
      end

      #
      # @param {Long} discount_identifier
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_discount_identifier discount_identifier, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {discount_identifier: discount_identifier, queryScope: query_scope})
      end

      #
      # @param {Long} discount_identifier_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_discount_identifier_eid discount_identifier_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {discount_identifier_eid: discount_identifier_eid, queryScope: query_scope})
      end

      #
      # @param {Long} price_list_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_price_list_eid price_list_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {price_list_eid: price_list_eid, queryScope: query_scope})
      end

      #
      # @param {String} price_list_is_master
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_price_list_is_master price_list_is_master, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {price_list_is_master: price_list_is_master, queryScope: query_scope})
      end

      #
      # @param {String} currency_type
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_currency_type currency_type, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {currency_type: currency_type, queryScope: query_scope})
      end

      #
      # @param {Long} product_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_product_eid product_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {product_eid: product_eid, queryScope: query_scope})
      end

    end

  end

end
