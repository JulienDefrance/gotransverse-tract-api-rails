module GoTransverseTractApi

  module GeneralLedger

    class GLAccountingTransaction

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
        # @param {Long} gl_transaction_batch_eid
        # @param {Hash} options
        #
        def find_by_gl_transaction_batch_eid gl_transaction_batch_eid, options={}
          return nil unless gl_transaction_batch_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({gl_transaction_batch_eid: gl_transaction_batch_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} batch_num
        # @param {Hash} options
        #
        def find_by_batch_num batch_num, options={}
          return nil unless batch_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({batch_num: batch_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Date} batch_posted_on
        # @param {Hash} options
        #
        def find_by_batch_posted_on batch_posted_on, options={}
          return nil unless batch_posted_on.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({batch_posted_on: batch_posted_on}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Date} occurred_on
        # @param {Hash} options
        #
        def find_by_occurred_on occurred_on, options={}
          return nil unless occurred_on.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({occurred_on: occurred_on}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} currency_type
        # @param {Hash} options
        #
        def find_by_currency_type currency_type, options={}
          return nil unless currency_type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({currency_type: currency_type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} original_currency_type
        # @param {Hash} options
        #
        def find_by_original_currency_type original_currency_type, options={}
          return nil unless original_currency_type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({original_currency_type: original_currency_type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
