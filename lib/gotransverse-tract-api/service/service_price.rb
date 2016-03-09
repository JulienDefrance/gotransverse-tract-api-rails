module GoTransverseTractApi

  module Service

    class ServicePrice < Common::ServiceBase

      class << self

        #
        # @param {Long} recurrence_period
        # @param {Hash} options
        #
        def find_by_recurrence_period recurrence_period, options={}
          return nil unless recurrence_period.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({recurrence_period: recurrence_period}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
