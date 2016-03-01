module GoTransverseTractApi

  module GeneralLedger

    class GLAggregateBatch

      class << self

        #
        # @param {Long} eid
        # @param {Hash} options
        #
        def find_by_eid eid, options=nil
          return nil unless eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} batch_num
        # @param {Hash} options
        #
        def find_by_batch_num batch_num, options=nil
          return nil unless batch_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({batch_num: batch_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} status
        # @param {Hash} options
        #
        def find_by_status status, options=nil
          return nil unless status.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({status: status}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Boolean} exported
        # @param {Hash} options
        #
        def find_by_exported exported, options=nil
          return nil unless exported.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({exported: exported}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {DateTime} posted_on
        # @param {Hash} options
        #
        def find_by_posted_on posted_on, options=nil
          return nil unless posted_on.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({posted_on: posted_on}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Date} batch_posted_on
        # @param {Hash} options
        #
        def find_by_batch_posted_on batch_posted_on, options=nil
          return nil unless batch_posted_on.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({batch_posted_on: batch_posted_on}, options)
          GoTransverseTractApi.get_response_for(self, params)
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
