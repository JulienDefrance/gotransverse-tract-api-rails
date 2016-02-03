module GoTransverseTractApi

  module Product

    class DiscountIdentifier

      class << self

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} identifier
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_identifier identifier, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {identifier: identifier, queryScope: query_scope})
        end

        #
        # @param {Long} order_item_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_order_item_eid order_item_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {order_item_eid: order_item_eid, queryScope: query_scope})
        end

      end

    end

  end

end
