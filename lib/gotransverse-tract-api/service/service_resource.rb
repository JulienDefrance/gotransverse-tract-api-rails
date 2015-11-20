module GoTransverseTractApi

  module Service

    class ServiceResource

      class << self

        #
        # @param {Long} eid
        #
        def self.find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} service_eid
        #
        def find_by_service_eid service_eid
          GoTransverseTractApi.get_response_for(self, {service_eid: service_eid})
        end

        #
        # @param {Long} order_item_eid
        #
        def find_by_order_item_eid order_item_eid
          GoTransverseTractApi.get_response_for(self, {order_item_eid: order_item_eid})
        end

        #
        # @param {Long} service_resource_category_eid
        #
        def find_by_service_resource_category_eid service_resource_category_eid
          GoTransverseTractApi.get_response_for(self, {service_resource_category_eid: service_resource_category_eid})
        end

        #
        # @param {Long} identifier
        #
        def self.find_by_identifier identifier
          GoTransverseTractApi.get_response_for(self, {identifier: identifier})
        end

        #
        # @param {String} status
        #
        def find_by_status status
          GoTransverseTractApi.get_response_for(self, {status: status})
        end

        #
        # @param {String} description
        #
        def find_by_description description
          GoTransverseTractApi.get_response_for(self, {description: description})
        end

        #
        # @param {Nokogiri::XML::Document} service_resource
        #
        def request service_resource
          GoTransverseTractApi.post_request_for(self, {}, service_resource.to_s, "request")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service_resource
        #
        def change eid, service_resource
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service_resource.to_s, "change")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service_resource
        #
        def deactivate eid, service_resource
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service_resource.to_s, "deactivate")
        end

        #
        # @param {Nokogiri::XML::Document} service_resource
        #
        def create_service_resource service_resource
          GoTransverseTractApi.post_request_for(self, {}, service_resource.to_s, "")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service_resource
        #
        def update eid, service_resource
          GoTransverseTractApi.put_response_for(self, {eid: eid}, service_resource.to_s)
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service_resource
        #
        def self.add_service_resource eid, service_resource
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service_resource.to_s, "addServiceResource")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service_resource
        #
        def self.remove_service_resource eid, service_resource
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service_resource.to_s, "removeServiceResource")
        end

      end

    end

  end

end
