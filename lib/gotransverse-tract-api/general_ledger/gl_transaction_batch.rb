module GoTransverseTractApi

  module GeneralLedger

    class GLTransactionBatch

      class << self

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} batch_num
        #
        def find_by_batch_num batch_num
          GoTransverseTractApi.get_response_for(self, {batch_num: batch_num})
        end

        #
        # @param {DateTime} posted_on
        #
        def find_by_posted_on posted_on
          GoTransverseTractApi.get_response_for(self, {posted_on: posted_on})
        end

        #
        # @param {Boolean} exported
        #
        def find_by_exported exported
          GoTransverseTractApi.get_response_for(self, {exported: exported})
        end

        #
        # @param {String} status
        #
        def find_by_status status
          GoTransverseTractApi.get_response_for(self, {status: status})
        end

        #
        # @param {Long} eid
        # @param {Hash} gl_transaction_batch
        #
        def update eid, gl_transaction_batch
          GoTransverseTractApi.put_request_for(self, {eid: eid}, gl_transaction_batch)
        end

      end

    end

  end

end
