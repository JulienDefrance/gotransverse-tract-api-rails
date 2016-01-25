module GoTransverseTractApi

  module Product

    class ServiceResourceCategory  
      def self.get_service_resource_category(service_resource_category)
        service_resource_category = {
          name: service_resource_category[:name],
          type: service_resource_category[:type],
          status: service_resource_category[:status],
          eid: service_resource_category[:eid]
        }

        service_resource_category
      end
    end

  end

end
