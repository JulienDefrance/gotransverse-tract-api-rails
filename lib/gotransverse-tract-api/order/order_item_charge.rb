module GoTransverseTractApi

  module Order

    class OrderItemCharge

      class << self

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} order_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_order_eid order_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {order_eid: order_eid, queryScope: query_scope})
        end

        #
        # @param {Long} order_item_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_order_item_eid order_item_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {order_item_eid: order_item_eid, queryScope: query_scope})
        end

        #
        # @param {Long} account_num
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_account_num account_num, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {account_num: account_num, queryScope: query_scope})
        end

        #
        # @param {Long} billing_account_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_billing_account_eid billing_account_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid, queryScope: query_scope})
        end

        #
        # @param {String} not_to_invoice
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_not_to_invoice not_to_invoice, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {not_to_invoice: not_to_invoice, queryScope: query_scope})
        end

        #
        # @param {Boolean} invoiced
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_invoiced invoiced, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {invoiced: invoiced, queryScope: query_scope})
        end

      end

    end

  end

end
