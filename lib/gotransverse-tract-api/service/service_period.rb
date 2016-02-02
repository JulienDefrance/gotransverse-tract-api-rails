module GoTransverseTractApi

  module Service

    class ServicePeriod

      class << self

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def self.find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} service_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_service_eid service_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {service_eid: service_eid, queryScope: query_scope})
        end

        #
        # @param {Date} start_date
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_start_date start_date, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {start_date: start_date, queryScope: query_scope})
        end

        #
        # @param {Date} end_date
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_end_date end_date, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {end_date: end_date, queryScope: query_scope})
        end

        #
        # @param {Boolean} closed
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_closed closed, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {closed: closed, queryScope: query_scope})
        end

      end

    end

  end

end
