module GoTransverseTractApi

  module GeneralLedger

    class GLAccountingEntry

      class << self

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} gl_account_eid
        #
        def find_by_gl_account_eid gl_account_eid
          GoTransverseTractApi.get_response_for(self, {gl_account_eid: gl_account_eid})
        end

        #
        # @param {Long} gl_accounting_transaction_eid
        #
        def find_by_gl_accounting_transaction_eid gl_accounting_transaction_eid
          GoTransverseTractApi.get_response_for(self, {gl_accounting_transaction_eid: gl_accounting_transaction_eid})
        end

        #
        # @param {Long} gl_transaction_batch_num
        #
        def find_by_gl_transaction_batch_num gl_transaction_batch_num
          GoTransverseTractApi.get_response_for(self, {gl_transaction_batch_num: gl_transaction_batch_num})
        end

        #
        # @param {Long} gl_aggregate_eid
        #
        def find_by_gl_aggregate_eid gl_aggregate_eid
          GoTransverseTractApi.get_response_for(self, {gl_aggregate_eid: gl_aggregate_eid})
        end

        #
        # @param {Long} gl_aggregate_batch_num
        #
        def find_by_gl_aggregate_batch_num gl_aggregate_batch_num
          GoTransverseTractApi.get_response_for(self, {gl_aggregate_batch_num: gl_aggregate_batch_num})
        end

      end

    end

  end

end
