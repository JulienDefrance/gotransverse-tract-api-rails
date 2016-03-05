module GoTransverseTractApi

  module BillingAccount

    class InvoiceItemCharge < InvoiceItem

      class << self

        #
        # @param {Long} invoice_item_eid
        # @param {Hash} options
        #
        def find_by_invoice_item_eid invoice_item_eid, options={}
          return nil unless invoice_item_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({invoice_item_eid: invoice_item_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
