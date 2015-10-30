module GoTransverseTractApi

  module Product

    class Action

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

    end

  end

end