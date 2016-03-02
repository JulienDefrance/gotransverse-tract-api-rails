module GoTransverseTractApi

  module Service

    class ServiceResourceCategory

      class << self

        #
        # @param {Hash} options
        #
        def find_all options=nil
          params ||= GoTransverseTractApi::ApiData.new.get_query_params({}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} eid
        # @param {Hash} options
        #
        def find_by_eid eid, options=nil
          return nil unless eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} name
        # @param {Hash} options
        #
        def find_by_name name, options=nil
          return nil unless name.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({name: name}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} type
        # @param {Hash} options
        #
        def find_by_type type, options=nil
          return nil unless type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({type: type}, options)
          GoTransverseTractApi.get_response_for(self, params)
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
