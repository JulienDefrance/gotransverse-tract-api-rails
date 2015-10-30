module GoTransverseTractApi

  module Product

    class Operation

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self.class, {eid: eid})
      end

      #
      # @param {Long} action_eid
      #
      def self.find_by_action_eid action_eid
        GoTransverseTractApi.get_response_for(self.class, {action_eid: action_eid})
      end

    end

  end

end