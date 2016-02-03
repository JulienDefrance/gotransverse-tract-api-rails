module GoTransverseTractApi

  module GeneralLedger

    class GLAccountingEntry

      class << self

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} gl_account_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_gl_account_eid gl_account_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {gl_account_eid: gl_account_eid, queryScope: query_scope})
        end

        #
        # @param {Long} gl_accounting_transaction_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_gl_accounting_transaction_eid gl_accounting_transaction_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {gl_accounting_transaction_eid: gl_accounting_transaction_eid, queryScope: query_scope})
        end

        #
        # @param {Long} gl_transaction_batch_num
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_gl_transaction_batch_num gl_transaction_batch_num, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {gl_transaction_batch_num: gl_transaction_batch_num, queryScope: query_scope})
        end

        #
        # @param {Long} gl_aggregate_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_gl_aggregate_eid gl_aggregate_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {gl_aggregate_eid: gl_aggregate_eid, queryScope: query_scope})
        end

        #
        # @param {Long} gl_aggregate_batch_num
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_gl_aggregate_batch_num gl_aggregate_batch_num, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {gl_aggregate_batch_num: gl_aggregate_batch_num, queryScope: query_scope})
        end

      end

    end

  end

end
