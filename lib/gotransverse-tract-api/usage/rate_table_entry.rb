module GoTransverseTractApi

  module Usage

    class RateTableEntry

      class << self

        #
        # @param {Long} eid
        # @param {Hash} options
        #
        def find_by_eid eid, options={}
          return nil unless eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({rateTableEid: eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
