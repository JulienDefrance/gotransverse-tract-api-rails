module GoTransverseTractApi

  module Service

    class ServicePeriod

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
        # @param {Date} start_date
        # @param {Hash} options
        #
        def find_by_start_date start_date, options={}
          return nil unless start_date.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({start_date: start_date}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Date} end_date
        # @param {Hash} options
        #
        def find_by_end_date end_date, options={}
          return nil unless end_date.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({end_date: end_date}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Boolean} closed
        # @param {Hash} options
        #
        def find_by_closed closed, options={}
          return nil unless closed.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({closed: closed}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
