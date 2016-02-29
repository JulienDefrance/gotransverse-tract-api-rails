module GoTransverseTractApi

  module Product

    class BillingAccountSegmentField

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
        # @param {Long} billing_account_segment_eid
        # @param {Hash} options
        #
        def find_by_billing_account_segment_eid billing_account_segment_eid, options=nil
          return nil unless billing_account_segment_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({billing_account_segment_eid: billing_account_segment_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} billing_account_segment_name
        # @param {Hash} options
        #
        def find_by_billing_account_segment_name billing_account_segment_name, options=nil
          return nil unless billing_account_segment_name.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({billing_account_segment_name: billing_account_segment_name}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} type
        # @param {Hash} options
        #
        def find_by_type type, options=nil
          return nil unless type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({type: type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Boolean} required
        # @param {Hash} options
        #
        def find_by_required required, options=nil
          return nil unless required.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({required: required}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
