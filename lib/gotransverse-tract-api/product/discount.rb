module GoTransverseTractApi

  module Product

    class Discount < DiscountCategory

      class << self
        
        #
        # @param {String} type
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_type type, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {type: type, queryScope: query_scope})
        end

        #
        # @param {Long} discount_category_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_discount_category_eid discount_category_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {discount_category_eid: discount_category_eid, queryScope: query_scope})
        end
       
        #
        # @param {Boolean} one_time
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_one_time one_time, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {one_time: one_time, queryScope: query_scope})
        end

        #
        # @param {Boolean} recurring
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_recurring recurring, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {recurring: recurring, queryScope: query_scope})
        end

        #
        # @param {String} currency_type
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_currency_type currency_type, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {currency_type: currency_type, queryScope: query_scope})
        end

      end

    end

  end

end
