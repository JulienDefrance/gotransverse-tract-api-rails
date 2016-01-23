module GoTransverseTractApi

  module Product

    class PriceList

      def self.find_all
        GoTransverseTractApi.get_response_for(self)
      end

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self, {eid: eid})
      end

      #
      # @param {String} name
      #
      def self.find_by_name name
        GoTransverseTractApi.get_response_for(self, {name: name})
      end

      #
      # @param {Hash} price_list
      #
      def self.get_price_list price_list
        {
          name: price_list[:name],
          eid: price_list[:eid]
        }
      end
    end

  end

end
