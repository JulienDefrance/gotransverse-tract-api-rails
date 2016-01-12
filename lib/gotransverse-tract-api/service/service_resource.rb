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
        # @param {Hash} service_resource
        #
        def request service_resource
          data = {
            requestServiceResource: {
              identifier: service_resource[:identifier],
              status: service_resource[:status],
              description: service_resource[:description]
            },
            serviceResourceCategory: {eid: service_resource[:service_resource_category][:eid]}
          }
          xml_data = GoTransverseTractApi.generateXML(data, 'requestServiceResource')
          GoTransverseTractApi.post_request_for(self, {}, xml_data, "request")
        end

        #
        # @param {Long} eid
        # @param {Hash} service_resource
        #
        def change eid, service_resource
          data = {
            changeServiceResource: {},
            serviceResource: {eid: eid},
            changeToServiceResource: {
              attributes: {
                identifier: service_resource[:change_to_service_resource][:identifier],
                status: service_resource[:change_to_service_resource][:status],
                description: service_resource[:change_to_service_resource][:description]
              },
              category: {eid: service_resource[:category][:eid]}
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'changeServiceResource')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "change")
        end

        #
        # @param {Long} eid
        # @param {Hash} service_resource
        #
        def deactivate eid, service_resource
          data = {
            deactivateServiceResource: {},
            serviceResource: {eid: eid}
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'deactivateServiceResource')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "deactivate")
        end

        #
        # @param {Hash} service_resource
        #
        def create_service_resource service_resource
          data = {
            serviceResource: {
              identifier: service_resource[:identifier],
              status: service_resource[:status],
              description: service_resource[:description]
            },
            category: {eid: service_resource[:category][:eid]}
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'serviceResource')
          GoTransverseTractApi.post_request_for(self, {}, xml_data, "")
        end

        #
        # @param {Long} eid
        # @param {Hash} service_resource
        #
        def update eid, service_resource
          data = {
            serviceResource: {
              eid: eid,
              identifier: service_resource[:identifier],
              description: service_resource[:description]
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'serviceResource')
          GoTransverseTractApi.put_request_for(self, {eid: eid}, xml_data)
        end

        #
        # @param {Long} eid
        # @param {Hash} service_resource
        #
        def add_service_resource eid, service_resource
          data = {
            addServiceResourceToService: {},
            service: {eid: eid},
            serviceResource: {
              attributes: {
                identifier: service_resource[:identifier]
              },
              category: {eid: service_resource[:category][:eid]}
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'addServiceResourceToService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "addServiceResource")
        end

        #
        # @param {Long} eid
        # @param {Hash} service_resource
        #
        def self.remove_service_resource eid, service_resource
          data = {
            removeServiceResourceFromService: {},
            service: {eid: eid},
            serviceResource: {eid: service_resource[:eid]}
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'removeServiceResourceFromService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "removeServiceResource")
        end

      end

    end

  end

end
