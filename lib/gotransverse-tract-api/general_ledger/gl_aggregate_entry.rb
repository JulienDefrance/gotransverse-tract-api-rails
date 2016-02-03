module GoTransverseTractApi

  module GeneralLedger

    class GLAggregateEntry

      #
      # @param {Long} eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_eid eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
      end

      #
      # @param {Long} gl_account_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_gl_account_eid gl_account_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {gl_account_eid: gl_account_eid, queryScope: query_scope})
      end

      #
      # @param {Long} gl_aggregate_batch_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_gl_aggregate_batch_eid gl_aggregate_batch_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {gl_aggregate_batch_eid: gl_aggregate_batch_eid, queryScope: query_scope})
      end

      #
      # @param {DateTime} posted_on
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_posted_on posted_on, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {posted_on: posted_on, queryScope: query_scope})
      end

      #
      # @param {Long} batch_num
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_batch_num batch_num, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {batch_num: batch_num, queryScope: query_scope})
      end

    end

  end

end
