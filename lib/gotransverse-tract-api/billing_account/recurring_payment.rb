module GoTransverseTractApi

  module BillingAccount

    class RecurringPayment

      class << self

        def self.find_all
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
        # @param {Long} account_num
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_account_num account_num, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {account_num: account_num, queryScope: query_scope})
        end

        #
        # @param {Long} billing_account_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_billing_account_eid billing_account_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid, queryScope: query_scope})
        end

      end

    end

  end

end
