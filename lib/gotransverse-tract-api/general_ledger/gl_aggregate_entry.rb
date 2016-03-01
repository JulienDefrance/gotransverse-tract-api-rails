module GoTransverseTractApi

  module GeneralLedger

    class GLAggregateEntry

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
        # @param {DateTime} posted_on
        # @param {Hash} options
        #
        def find_by_posted_on posted_on, options=nil
          return nil unless posted_on.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({posted_on: posted_on}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} gl_account_eid
        # @param {Hash} options
        #
        def find_by_gl_account_eid gl_account_eid, options=nil
          return nil unless gl_account_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({gl_account_eid: gl_account_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} gl_aggregate_batch_eid
        # @param {Hash} options
        #
        def find_by_gl_aggregate_batch_eid gl_aggregate_batch_eid, options=nil
          return nil unless gl_aggregate_batch_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({gl_aggregate_batch_eid: gl_aggregate_batch_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
