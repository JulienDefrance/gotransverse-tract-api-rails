module GoTransverseTractApi

  module Order

    class ProductRelation

      class << self

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} product_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_product_eid product_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {product_eid: product_eid, queryScope: query_scope})
        end

        #
        # @param {String} type
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_type type, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {type: type, queryScope: query_scope})
        end

      end

    end

  end

end
