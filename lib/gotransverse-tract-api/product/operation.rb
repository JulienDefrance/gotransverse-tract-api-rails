module GoTransverseTractApi

  module Product

    class Operation

      #
      # @param {Long} eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_eid eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
      end

      #
      # @param {Long} action_eid
      #
      def self.find_by_action_eid action_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {action_eid: action_eid, queryScope: query_scope})
      end

    end

  end

end
