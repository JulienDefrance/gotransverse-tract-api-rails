module GoTransverseTractApi

  module GeneralLedger

    class GLAccountingTransaction

      class << self

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def self.find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} gl_transaction_batch_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def self.find_by_gl_transaction_batch_eid gl_transaction_batch_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {gl_transaction_batch_eid: gl_transaction_batch_eid, queryScope: query_scope})
        end

        #
        # @param {Long} batch_num
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def self.find_by_batch_num batch_num, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {batch_num: batch_num, queryScope: query_scope})
        end

        #
        # @param {Date} batch_posted_on
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def self.find_by_batch_posted_on batch_posted_on, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {batch_posted_on: batch_posted_on, queryScope: query_scope})
        end

        #
        # @param {Date} occurred_on
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def self.find_by_occurred_on occurred_on, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {occurred_on: occurred_on, queryScope: query_scope})
        end

        #
        # @param {String} currency_type
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def self.find_by_currency_type currency_type, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {currency_type: currency_type, queryScope: query_scope})
        end

        #
        # @param {String} original_currency_type
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def self.find_by_original_currency_type original_currency_type, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {original_currency_type: original_currency_type, queryScope: query_scope})
        end

      end

    end

  end

end
