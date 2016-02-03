module GoTransverseTractApi

  module GeneralLedger

    class GLAggregateBatch

      class << self

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} batch_num
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_batch_num batch_num, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {batch_num: batch_num, queryScope: query_scope})
        end

        #
        # @param {String} status
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_status status, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {status: status, queryScope: query_scope})
        end

        #
        # @param {Boolean} exported
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_exported exported, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {exported: exported, queryScope: query_scope})
        end

        #
        # @param {DateTime} posted_on
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_posted_on posted_on, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {posted_on: posted_on, queryScope: query_scope})
        end

        #
        # @param {DateTime} batch_posted_on
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_batch_posted_on batch_posted_on, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {batch_posted_on: batch_posted_on, queryScope: query_scope})
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
          GoTransverseTractApi.put_request_for(self, {eid: eid}, xml_data)
        end

      end

    end

  end

end
