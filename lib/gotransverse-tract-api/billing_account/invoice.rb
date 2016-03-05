module GoTransverseTractApi

  module BillingAccount

    class Invoice

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
        # @param {Long} account_num
        # @param {Hash} options
        #
        def find_by_account_num account_num, options={}
          return nil unless account_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({account_num: account_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} billing_account_eid
        # @param {Hash} options
        #
        def find_by_billing_account_eid billing_account_eid, options={}
          return nil unless billing_account_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({billing_account_eid: billing_account_eid}, options)
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
        # @param {Long} event_eid
        # @param {Hash} options
        #
        def find_by_event_eid event_eid, options={}
          return nil unless event_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({event_eid: event_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} status
        # @param {Hash} options
        #
        def find_by_status status, options={}
          return nil unless status.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({status: status}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {DateTime} occurred_on
        # @param {Hash} options
        #
        def find_by_occurred_on occurred_on, options={}
          return nil unless occurred_on.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({occurred_on: occurred_on}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} adjustment_eid
        # @param {Hash} options
        #
        def find_by_adjustment_eid adjustment_eid, options={}
          return nil unless adjustment_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({adjustment_eid: adjustment_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {DateTime} where_invoice
        # @param {Hash} options
        #
        # Example
        # whereInvoice=(occurredOn gte '2011-06-15' and occurredOn lte '2011-07-13')
        def find_by_where_invoice where_invoice, options={}
          return nil unless where_invoice.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({where_invoice: where_invoice}, options)
          GoTransverseTractApi.get_response_for(self, params)
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
