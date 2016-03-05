module GoTransverseTractApi

  module Service

    class ServiceResource

      class << self

        #
        # @param {Long} eid
        # @param {Hash} options
        #
        def find_by_eid eid, options={}
          return nil unless eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} service_eid
        # @param {Hash} options
        #
        def find_by_service_eid service_eid, options={}
          return nil unless service_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({service_eid: service_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} order_item_eid
        # @param {Hash} options
        #
        def find_by_order_item_eid order_item_eid, options={}
          return nil unless order_item_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({order_item_eid: order_item_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} service_resource_category_eid
        # @param {Hash} options
        #
        def find_by_service_resource_category_eid service_resource_category_eid, options={}
          return nil unless service_resource_category_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({service_resource_category_eid: service_resource_category_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} identifier
        # @param {Hash} options
        #
        def find_by_identifier identifier, options={}
          return nil unless identifier.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({identifier: identifier}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} status
        # @param {Hash} options
        #
        def find_by_status status, options={}
          return nil unless status.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({status: status}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} description
        # @param {Hash} options
        #
        def find_by_description description, options={}
          return nil unless description.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({description: description}, options)
          GoTransverseTractApi.get_response_for(self, params)
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
        def remove_service_resource eid, service_resource
          data = {
            removeServiceResourceFromService: {},
            service: {eid: eid},
            serviceResource: {eid: service_resource[:eid]}
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'removeServiceResourceFromService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "removeServiceResource")
        end

        #
        # @param {Hash} service_resource
        #
        def get_service_resource service_resources
          svc_resource = service_resources[:service_resource]
          service_resource = {
            attributes: {}, 
            serviceResource: {
              attributes: {
                eid: svc_resource[:eid],
                identifier: svc_resource[:identifier],
                description: svc_resource[:description],
                autoSelect: svc_resource[:autoSelect],
                status: svc_resource[:status]
              }.delete_if{|k,v| v.nil?},
              category: {
                eid: svc_resource[:category].try(:[],:eid),
                name: svc_resource[:category].try(:[],:name),
                type: svc_resource[:category].try(:[],:type),
                status: svc_resource[:category].try(:[],:status)
              }.delete_if{|k,v| v.nil?}
            }
          }

          service_resource
        end
      end

    end

  end

end
