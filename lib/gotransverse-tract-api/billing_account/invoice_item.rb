module GoTransverseTractApi

  module BillingAccount

    class InvoiceItem

      class << self

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} invoice_num
        #
        def find_by_invoice_num invoice_num
          GoTransverseTractApi.get_response_for(self, {invoice_num: invoice_num})
        end

        #
        # @param {Long} invoice_eid
        #
        def find_by_invoice_eid invoice_eid
          GoTransverseTractApi.get_response_for(self, {invoice_eid: invoice_eid})
        end

      end

    end

  end

end
