module GoTransverseTractApi

  module BillingAccount

    class Adjustment

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
        # @param {Long} invoice_eid
        #
        def find_by_invoice_eid invoice_eid
          GoTransverseTractApi.get_response_for(self, {invoice_eid: invoice_eid})
        end

        #
        # @param {String} status
        #
        def find_by_status status
          GoTransverseTractApi.get_response_for(self, {status: status})
        end

        #
        # @param {Long} eid
        # @param {Hash} adjustment
        #
        def post eid, adjustment
          GoTransverseTractApi.post_request_for(self, {eid: eid}, adjustment, "post")
        end

        #
        # @param {Long} eid
        # @param {Hash} adjustment
        #
        def reverse eid, adjustment
          GoTransverseTractApi.post_request_for(self, {eid: eid}, adjustment, "reverse")
        end

        #
        # @param {Long} eid
        # @param {Hash} adjustment
        #
        def add_invoice_application eid, adjustment
          GoTransverseTractApi.post_request_for(self, {eid: eid}, adjustment, "addInvoiceApplication")
        end

        #
        # @param {Long} eid
        # @param {Hash} adjustment
        #
        def reverse_invoice_application eid, adjustment
          GoTransverseTractApi.post_request_for(self, {eid: eid}, adjustment, "reverseInvoiceApplication")
        end

        #
        # @param {Hash} adjustment
        #
        def create_adjustment adjustment
          GoTransverseTractApi.post_request_for(self, {}, adjustment, "")
        end

      end

    end

  end

end
