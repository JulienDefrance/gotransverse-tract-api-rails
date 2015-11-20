module GoTransverseTractApi

  module Service

    class ServicePeriod

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
        # @param {Date} start_date
        #
        def find_by_start_date start_date
          GoTransverseTractApi.get_response_for(self, {start_date: start_date})
        end

        #
        # @param {Date} end_date
        #
        def find_by_end_date end_date
          GoTransverseTractApi.get_response_for(self, {end_date: end_date})
        end

        #
        # @param {Boolean} closed
        #
        def find_by_closed closed
          GoTransverseTractApi.get_response_for(self, {closed: closed})
        end

      end

    end

  end

end
