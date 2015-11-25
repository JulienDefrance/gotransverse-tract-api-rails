module GoTransverseTractApi

  module BillingAccount

    class InvoiceItemCharge < InvoiceItem

      class << self

        #
        # @param {Long} invoice_item_eid
        #
        def find_by_invoice_item_eid invoice_item_eid
          GoTransverseTractApi.get_response_for(self, {invoice_item_eid: invoice_item_eid})
        end

      end

    end

  end

end
