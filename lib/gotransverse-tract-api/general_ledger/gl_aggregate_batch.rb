module GoTransverseTractApi

  module GeneralLedger

    class GLAggregateBatch

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
        # @param {String} status
        #
        def find_by_status status
          GoTransverseTractApi.get_response_for(self, {status: status})
        end

        #
        # @param {Boolean} exported
        #
        def find_by_exported exported
          GoTransverseTractApi.get_response_for(self, {exported: exported})
        end

        #
        # @param {DateTime} posted_on
        #
        def find_by_posted_on posted_on
          GoTransverseTractApi.get_response_for(self, {posted_on: posted_on})
        end

        #
        # @param {DateTime} batch_posted_on
        #
        def find_by_batch_posted_on batch_posted_on
          GoTransverseTractApi.get_response_for(self, {batch_posted_on: batch_posted_on})
        end

        #
        # @param {Long} eid
        # @param {Hash} gl_aggregate_batch
        #
        def update eid, gl_aggregate_batch
          data = {
            glAggregateBatch: {
              eid: eid,
              exported: 'true'
            }      
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'glAggregateBatch')
          GoTransverseTractApi.put_request_for(self, {eid: eid}, gl_aggregate_batch)
        end

      end

    end

  end

end
