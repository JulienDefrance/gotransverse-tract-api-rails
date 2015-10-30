module GoTransverseTractApi

  module Product

    class PriceList

      def self.find_all
        GoTransverseTractApi.get_response_for(self.class)
      end

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self.class, {eid: eid})
      end

      #
      # @param {String} name
      #
      def self.find_by_name name
        GoTransverseTractApi.get_response_for(self.class, {name: name})
      end

    end

  end

end