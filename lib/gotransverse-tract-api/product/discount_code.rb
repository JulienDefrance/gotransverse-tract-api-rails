module GoTransverseTractApi

  module Product

    class DiscountCode < DiscountCategory

      #
      # @param {Long} discount_charge_category_eid
      # @param {Hash} options
      #
      def self.find_by_discount_charge_category_eid discount_charge_category_eid, options=nil
        return nil unless discount_charge_category_eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({discount_charge_category_eid: discount_charge_category_eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {DateTime} valid_from
      # @param {Hash} options
      #
      def self.find_by_valid_from valid_from, options=nil
        return nil unless valid_from.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({valid_from: valid_from}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {DateTime} valid_to
      # @param {Hash} options
      #
      def self.find_by_valid_to valid_to, options=nil
        return nil unless valid_to.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({valid_to: valid_to}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} discount_eid
      # @param {Hash} options
      #
      def self.find_by_discount_eid discount_eid, options=nil
        return nil unless discount_eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({discount_eid: discount_eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} discount_identifier
      # @param {Hash} options
      #
      def self.find_by_discount_identifier discount_identifier, options=nil
        return nil unless discount_identifier.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({discount_identifier: discount_identifier}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} discount_identifier_eid
      # @param {Hash} options
      #
      def self.find_by_discount_identifier_eid discount_identifier_eid, options=nil
        return nil unless discount_identifier_eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({discount_identifier_eid: discount_identifier_eid}, options)
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
      # @param {String} price_list_is_master
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

      #
      # @param {Long} product_eid
      # @param {Hash} options
      #
      def self.find_by_product_eid product_eid, options=nil
        return nil unless product_eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_eid: product_eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

    end

  end

end
