module GoTransverseTractApi

  module Product

    class ProductPrice

      #
      # @param {Long} eid
      # @param {Hash} options
      #
      def self.find_by_eid eid, options=nil
        return nil unless eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} product_eid
      # @param {Hash} options
      #
      def self.find_by_product_eid product_eid, options=nil
        return nil unless product_eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_eid: product_eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {DateTime} from_date
      # @param {Hash} options
      #
      def self.find_from_date from_date, options=nil
        return nil unless from_date.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({from_date: from_date}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {DateTime} thru_date
      # @param {Hash} options
      #
      def self.find_thru_date thru_date, options=nil
        return nil unless thru_date.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({thru_date: thru_date}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} price_list_eid
      # @param {Hash} options
      #
      def self.find_by_price_list_eid price_list_eid, options=nil
        return nil unless price_list_eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({price_list_eid: price_list_eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Boolean} price_list_is_master
      # @param {Hash} options
      #
      def self.find_by_price_list_is_master price_list_is_master, options=nil
        return nil unless price_list_is_master.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({price_list_is_master: price_list_is_master}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {String} currency_type
      # @param {Hash} options
      #
      def self.find_by_currency_type currency_type, options=nil
        return nil unless currency_type.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({currency_type: currency_type}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

    end

  end

end
