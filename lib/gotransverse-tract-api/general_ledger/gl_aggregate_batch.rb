module GoTransverseTractApi

  module GeneralLedger

    class GLAggregateBatch

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self, {eid: eid})
      end

      #
      # @param {String} status
      #
      def self.find_by_status status
        GoTransverseTractApi.get_response_for(self, {status: status})
      end

      #
      # @param {Boolean} exported
      #
      def self.find_by_exported exported
        GoTransverseTractApi.get_response_for(self, {exported: exported})
      end

      #
      # @param {DateTime} posted_on
      #
      def self.find_by_posted_on posted_on
        GoTransverseTractApi.get_response_for(self, {posted_on: posted_on})
      end

    end

  end

end