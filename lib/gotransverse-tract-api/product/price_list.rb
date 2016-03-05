module GoTransverseTractApi

  module Product

    class PriceList

      #
      # @param {Hash} options
      #
      def self.find_all options={}
        params ||= GoTransverseTractApi::ApiData.new.get_query_params({}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} eid
      # @param {Hash} options
      #
      def self.find_by_eid eid, options={}
        return nil unless eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {String} name
      # @param {Hash} options
      #
      def self.find_by_name name, option={}
        return nil unless name.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({name: name}, options)
        GoTransverseTractApi.get_response_for(self, params)
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
