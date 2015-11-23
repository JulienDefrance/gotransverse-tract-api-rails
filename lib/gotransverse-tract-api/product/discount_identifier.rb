module GoTransverseTractApi

  module Product

    class DiscountIdentifier

      class << self

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} identifier
        #
        def find_by_identifier identifier
          GoTransverseTractApi.get_response_for(self, {identifier: identifier})
        end

        #
        # @param {Long} order_item_eid
        #
        def find_by_order_item_eid order_item_eid
          GoTransverseTractApi.get_response_for(self, {order_item_eid: order_item_eid})
        end

      end

    end

  end

end
