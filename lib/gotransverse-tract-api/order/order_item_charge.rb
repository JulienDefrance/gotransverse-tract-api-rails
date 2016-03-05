module GoTransverseTractApi

  module Order

    class OrderItemCharge

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
        # @param {Long} order_eid
        # @param {Hash} options
        #
        def find_by_order_eid order_eid, options={}
          return nil unless order_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({order_eid: order_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} order_item_eid
        # @param {Hash} options
        #
        def find_by_order_item_eid order_item_eid, options={}
          return nil unless order_item_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({order_item_eid: order_item_eid}, options)
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
        # @param {String} not_to_invoice
        # @param {Hash} options
        #
        def find_by_not_to_invoice not_to_invoice, options={}
          return nil unless not_to_invoice.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({not_to_invoice: not_to_invoice}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Boolean} invoiced
        # @param {Hash} options
        #
        def find_by_invoiced invoiced, options={}
          return nil unless invoiced.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({invoiced: invoiced}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
