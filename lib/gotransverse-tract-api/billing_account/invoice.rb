module GoTransverseTractApi

  module BillingAccount

    class Invoice

      class << self

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

        #
        # @param {Long} invoice_num
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_invoice_num invoice_num, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {invoice_num: invoice_num, queryScope: query_scope})
        end

        #
        # @param {Long} event_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_event_eid event_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {event_eid: event_eid, queryScope: query_scope})
        end

        #
        # @param {String} status
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_status status, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {status: status, queryScope: query_scope})
        end

        #
        # @param {DateTime} occurred_on
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_occurred_on occurred_on, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {occurred_on: occurred_on, queryScope: query_scope})
        end

        #
        # @param {Long} adjustment_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_adjustment_eid adjustment_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {adjustment_eid: adjustment_eid, queryScope: query_scope})
        end

        #
        # @param {DateTime} where_invoice
        # @param {String} query_scope (default: 'SHALLOW')
        #
        # Example
        # whereInvoice=(occurredOn gte '2011-06-15' and occurredOn lte '2011-07-13')
        def find_by_where_invoice where_invoice, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {where_invoice: where_invoice, queryScope: query_scope})
        end

        #
        # @param {Long} eid
        # @param {Hash} invoice
        #
        def apply_payment eid, invoice
          xml_data = GoTransverseTractApi::ApiData.new.payment_details(invoice)
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "applyPayment")
        end

      end

    end

  end

end
