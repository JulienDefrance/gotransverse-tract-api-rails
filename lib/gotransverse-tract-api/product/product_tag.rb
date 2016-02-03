module GoTransverseTractApi

  module Product

    class ProductTag

      def self.find_all
        GoTransverseTractApi.get_response_for(self)
      end

      #
      # @param {Long} eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_eid eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
      end

      #
      # @param {String} name
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_name name, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {name: name, queryScope: query_scope})
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
