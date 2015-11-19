module GoTransverseTractApi

  module Order

    class OrderItemCharge

      class << self

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} order_eid
        #
        def find_by_order_eid order_eid
          GoTransverseTractApi.get_response_for(self, {order_eid: order_eid})
        end

        #
        # @param {Long} order_item_eid
        #
        def find_by_order_item_eid order_item_eid
          GoTransverseTractApi.get_response_for(self, {order_item_eid: order_item_eid})
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
        # @param {String} not_to_invoice
        #
        def find_by_not_to_invoice not_to_invoice
          GoTransverseTractApi.get_response_for(self, {not_to_invoice: not_to_invoice})
        end

        #
        # @param {Boolean} invoiced
        #
        def find_by_invoiced invoiced
          GoTransverseTractApi.get_response_for(self, {invoiced: invoiced})
        end

      end

    end

  end

end
