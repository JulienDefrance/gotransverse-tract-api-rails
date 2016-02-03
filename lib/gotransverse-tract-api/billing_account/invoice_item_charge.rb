module GoTransverseTractApi

  module BillingAccount

    class InvoiceItemCharge < InvoiceItem

      class << self

        #
        # @param {Long} invoice_item_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_invoice_item_eid invoice_item_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {invoice_item_eid: invoice_item_eid, queryScope: query_scope})
        end

      end

    end

  end

end
