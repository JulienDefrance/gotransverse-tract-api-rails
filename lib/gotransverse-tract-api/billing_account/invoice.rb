module GoTransverseTractApi

  module BillingAccount

    class Invoice

      class << self

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} account_num
        #
        def find_by_account_num account_num
          GoTransverseTractApi.get_response_for(self, {account_num: account_num})
        end

        #
        # @param {Long} billing_account_eid
        #
        def find_by_billing_account_eid billing_account_eid
          GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid})
        end

        #
        # @param {Long} invoice_num
        #
        def find_by_invoice_num invoice_num
          GoTransverseTractApi.get_response_for(self, {invoice_num: invoice_num})
        end

        #
        # @param {Long} event_eid
        #
        def find_by_event_eid event_eid
          GoTransverseTractApi.get_response_for(self, {event_eid: event_eid})
        end

        #
        # @param {String} status
        #
        def find_by_status status
          GoTransverseTractApi.get_response_for(self, {status: status})
        end

        #
        # @param {DateTime} occurred_on
        #
        def find_by_occurred_on occurred_on
          GoTransverseTractApi.get_response_for(self, {occurred_on: occurred_on})
        end

        #
        # @param {Long} adjustment_eid
        #
        def find_by_adjustment_eid adjustment_eid
          GoTransverseTractApi.get_response_for(self, {adjustment_eid: adjustment_eid})
        end

        #
        # @param {DateTime} where_invoice
        #
        # Example
        # whereInvoice=(occurredOn gte '2011-06-15' and occurredOn lte '2011-07-13')
        def find_by_where_invoice where_invoice
          GoTransverseTractApi.get_response_for(self, {where_invoice: where_invoice})
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
