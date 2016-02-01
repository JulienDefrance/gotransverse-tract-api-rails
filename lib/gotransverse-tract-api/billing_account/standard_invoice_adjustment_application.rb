module GoTransverseTractApi

  module BillingAccount

    class StandardInvoiceAdjustmentApplication < AdjustmentApplication

      class << self

        #
        # @param {Long} invoice_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_invoice_eid invoice_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {invoice_eid: invoice_eid, queryScope: query_scope})
        end

        #
        # @param {Long} invoice_num
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_invoice_num invoice_num, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {invoice_num: invoice_num, queryScope: query_scope})
        end

      end

    end

  end

end
