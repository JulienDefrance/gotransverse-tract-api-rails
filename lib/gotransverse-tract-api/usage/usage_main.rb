module GoTransverseTractApi

  module UsageMain

    class << self

      #
      # @param {Long} eid
      #
      def find_by_eid eid
        debugger
        GoTransverseTractApi.get_response_for(self, {eid: eid})
      end

    end

  end

end
