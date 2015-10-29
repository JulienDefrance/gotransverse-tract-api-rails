module GoTransverseTractApi

  module Product

    class Product

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

      #
      # @param {String} internal_name
      #
      def self.find_by_internal_name internal_name
        GoTransverseTractApi.get_response_for(self.class, {internal_name: internal_name})
      end

      #
      # @param {String} external_product_number
      #
      def self.find_by_external_product_number external_product_number
        GoTransverseTractApi.get_response_for(self.class, {external_product_number: external_product_number})
      end

      #
      # @param {String} sku
      #
      def self.find_by_sku sku
        GoTransverseTractApi.get_response_for(self.class, {sku: sku})
      end

      #
      # @param {String} product_type_code
      #
      def self.find_by_product_type_code product_type_code
        GoTransverseTractApi.get_response_for(self.class, {product_type_code: product_type_code})
      end

      #
      # @param {String} product_state
      #
      def self.find_by_product_state product_state
        GoTransverseTractApi.get_response_for(self.class, {product_state: product_state})
      end

      #
      # @param {Long} service_resource_category_eid
      #
      def self.find_by_service_resource_category_eid service_resource_category_eid
        GoTransverseTractApi.get_response_for(self.class, {service_resource_category_eid: service_resource_category_eid})
      end

      #
      # @param {String} service_resource_category_name
      #
      def self.find_by_service_resource_category_name service_resource_category_name
        GoTransverseTractApi.get_response_for(self.class, {service_resource_category_name: service_resource_category_name})
      end

      #
      # @param {Long} product_category_eid
      #
      def self.find_by_product_category_eid product_category_eid
        GoTransverseTractApi.get_response_for(self.class, {product_category_eid: product_category_eid})
      end

      #
      # @param {Boolean} price_list_is_master
      #
      def self.find_by_price_list_is_master price_list_is_master
        GoTransverseTractApi.get_response_for(self.class, {price_list_is_master: price_list_is_master})
      end
      
    end

  end

end

