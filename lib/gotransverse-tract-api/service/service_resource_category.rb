module GoTransverseTractApi

  module Service

    class ServiceResourceCategory

      class << self

        def find_all
          GoTransverseTractApi.get_response_for(self)
        end

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {String} name
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_name name, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {name: name, queryScope: query_scope})
        end

        #
        # @param {String} type
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_type type, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {type: type, queryScope: query_scope})
        end

        #
        # @param {Hash} service_resource_category
        #
        def get_service_resource_category(service_resource_category)
          svc_resource_category = {
            name: service_resource_category[:name],
            type: service_resource_category[:type],
            status: service_resource_category[:status],
            eid: service_resource_category[:eid]
          }

          svc_resource_category
        end
      end

    end

  end

end
