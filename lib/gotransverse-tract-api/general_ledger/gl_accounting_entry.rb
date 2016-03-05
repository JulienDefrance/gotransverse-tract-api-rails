module GoTransverseTractApi

  module GeneralLedger

    class GLAccountingEntry

      class << self

        #
        # @param {Long} eid
        # @param {Hash} options
        #
        def find_by_eid eid, options={}
          return nil unless eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} gl_account_eid
        # @param {Hash} options
        #
        def find_by_gl_account_eid gl_account_eid, options={}
          return nil unless gl_account_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({gl_account_eid: gl_account_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} gl_accounting_transaction_eid
        # @param {Hash} options
        #
        def find_by_gl_accounting_transaction_eid gl_accounting_transaction_eid, options={}
          return nil unless gl_accounting_transaction_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({gl_accounting_transaction_eid: gl_accounting_transaction_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} gl_transaction_batch_num
        # @param {Hash} options
        #
        def find_by_gl_transaction_batch_num gl_transaction_batch_num, options={}
          return nil unless gl_transaction_batch_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({gl_transaction_batch_num: gl_transaction_batch_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} gl_aggregate_eid
        # @param {Hash} options
        #
        def find_by_gl_aggregate_eid gl_aggregate_eid, options={}
          return nil unless gl_aggregate_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({gl_aggregate_eid: gl_aggregate_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} gl_aggregate_batch_num
        # @param {Hash} options
        #
        def find_by_gl_aggregate_batch_num gl_aggregate_batch_num, options={}
          return nil unless gl_aggregate_batch_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({gl_aggregate_batch_num: gl_aggregate_batch_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
