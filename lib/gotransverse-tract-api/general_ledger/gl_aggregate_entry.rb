module GoTransverseTractApi

  module GeneralLedger

    class GLAggregateEntry

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self, {eid: eid})
      end

      #
      # @param {Long} gl_account_eid
      #
      def self.find_by_gl_account_eid gl_account_eid
        GoTransverseTractApi.get_response_for(self, {gl_account_eid: gl_account_eid})
      end

      #
      # @param {Long} gl_aggregate_batch_eid
      #
      def self.find_by_gl_aggregate_batch_eid gl_aggregate_batch_eid
        GoTransverseTractApi.get_response_for(self, {gl_aggregate_batch_eid: gl_aggregate_batch_eid})
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