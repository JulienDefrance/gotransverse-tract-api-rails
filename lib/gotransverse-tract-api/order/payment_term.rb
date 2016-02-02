module GoTransverseTractApi

  module Order

    class PaymentTerm

      class << self

        def find_all
          GoTransverseTractApi.get_response_for(self)
        end

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} billing_account_category_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_billing_account_category_eid billing_account_category_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {billing_account_category_eid: billing_account_category_eid, queryScope: query_scope})
        end

        #
        # @param {Long} billing_account_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_billing_account_eid billing_account_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid, queryScope: query_scope})
        end

        #
        # @param {String} name
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_name name, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {name: name, queryScope: query_scope})
        end

      end

    end

  end

end
