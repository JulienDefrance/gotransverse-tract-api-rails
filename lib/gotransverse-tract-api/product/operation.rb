module GoTransverseTractApi

  module Product

    class Operation

      #
      # @param {Long} eid
      # @param {Hash} options
      #
      def self.find_by_eid eid, options=nil
        return nil unless eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} action_eid
      # @param {Hash} options
      #
      def self.find_by_action_eid action_eid, options=nil
        return nil unless action_eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({action_eid: action_eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

    end

  end

end
