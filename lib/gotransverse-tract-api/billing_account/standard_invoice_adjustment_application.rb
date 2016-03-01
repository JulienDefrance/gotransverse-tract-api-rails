module GoTransverseTractApi

  module BillingAccount

    class StandardInvoiceAdjustmentApplication < AdjustmentApplication

      class << self

        #
        # @param {Long} invoice_eid
        # @param {Hash} options
        #
        def find_by_invoice_eid invoice_eid, options=nil
          return nil unless invoice_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({invoice_eid: invoice_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} invoice_num
        # @param {Hash} options
        #
        def find_by_invoice_num invoice_num, options=nil
          return nil unless invoice_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({invoice_num: invoice_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
