module GoTransverseTractApi

  module BillingAccount

    class InvoiceItem

      class << self

        #
        # @param {Long} eid
        # @param {Hash} options
        #
        def find_by_eid eid, options={}
          return nil unless eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} invoice_num
        # @param {Hash} options
        #
        def find_by_invoice_num invoice_num, options={}
          return nil unless invoice_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({invoice_num: invoice_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} invoice_eid
        # @param {Hash} options
        #
        def find_by_invoice_eid invoice_eid, options={}
          return nil unless invoice_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({invoice_eid: invoice_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
