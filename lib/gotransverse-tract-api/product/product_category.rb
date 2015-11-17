module GoTransverseTractApi

  module Product

    class ProductCategory

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
      # @param {String} status
      #
      def self.find_by_status status
        GoTransverseTractApi.get_response_for(self, {status: status})
      end

    end

  end

end