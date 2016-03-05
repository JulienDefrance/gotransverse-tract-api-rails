module GoTransverseTractApi

  module Order

    class PaymentTerm

      class << self

        #
        # @param {Hash} options
        #
        def find_all options={}
          params ||= GoTransverseTractApi::ApiData.new.get_query_params({}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

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
        # @param {String} name
        # @param {Hash} options
        #
        def find_by_name name, options={}
          return nil unless name.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({name: name}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} billing_account_category_eid
        # @param {Hash} options
        #
        def find_by_billing_account_category_eid billing_account_category_eid, options={}
          return nil unless billing_account_category_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({billing_account_category_eid: billing_account_category_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} billing_account_eid
        # @param {Hash} options
        #
        def find_by_billing_account_eid billing_account_eid, options={}
          return nil unless billing_account_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({billing_account_eid: billing_account_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
