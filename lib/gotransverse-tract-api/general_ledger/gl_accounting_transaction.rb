module GoTransverseTractApi

  module GeneralLedger

    class GLAccountingTransaction

      class << self

        #
        # @param {Long} eid
        #
        def self.find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} gl_transaction_batch_eid
        #
        def self.find_by_gl_transaction_batch_eid gl_transaction_batch_eid
          GoTransverseTractApi.get_response_for(self, {gl_transaction_batch_eid: gl_transaction_batch_eid})
        end

        #
        # @param {Long} batch_num
        #
        def self.find_by_batch_num batch_num
          GoTransverseTractApi.get_response_for(self, {batch_num: batch_num})
        end

        #
        # @param {Date} batch_posted_on
        #
        def self.find_by_batch_posted_on batch_posted_on
          GoTransverseTractApi.get_response_for(self, {batch_posted_on: batch_posted_on})
        end

        #
        # @param {Date} occurred_on
        #
        def self.find_by_occurred_on occurred_on
          GoTransverseTractApi.get_response_for(self, {occurred_on: occurred_on})
        end

        #
        # @param {String} currency_type
        #
        def self.find_by_currency_type currency_type
          GoTransverseTractApi.get_response_for(self, {currency_type: currency_type})
        end

        #
        # @param {String} original_currency_type
        #
        def self.find_by_original_currency_type original_currency_type
          GoTransverseTractApi.get_response_for(self, {original_currency_type: original_currency_type})
        end

      end

    end

  end

end
