module GoTransverseTractApi

  module Service

    class ServicePeriod < Common::ServiceBase

      class << self

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
