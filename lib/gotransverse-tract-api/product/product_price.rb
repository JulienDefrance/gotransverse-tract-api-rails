module GoTransverseTractApi

  module Product

    class ProductPrice

      #
      # @param {Long} eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_eid eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
      end

      #
      # @param {Long} product_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_product_eid product_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {product_eid: product_eid, queryScope: query_scope})
      end

      #
      # @param {DateTime} from_date
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_from_date from_date, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {from_date: from_date, queryScope: query_scope})
      end

      #
      # @param {DateTime} thru_date
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_thru_date thru_date, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {thru_date: thru_date, queryScope: query_scope})
      end

      #
      # @param {Long} price_list_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_price_list_eid price_list_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {price_list_eid: price_list_eid, queryScope: query_scope})
      end

      #
      # @param {Boolean} price_list_is_master
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

    end

  end

end
