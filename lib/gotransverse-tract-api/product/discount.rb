module GoTransverseTractApi

  module Product

    class Discount < DiscountCategory

      class << self
        
        #
        # @param {String} type
        #
        def find_by_type type
          GoTransverseTractApi.get_response_for(self, {type: type})
        end

        #
        # @param {Long} discount_category_eid
        #
        def find_by_discount_category_eid discount_category_eid
          GoTransverseTractApi.get_response_for(self, {discount_category_eid: discount_category_eid})
        end
       
        #
        # @param {Boolean} one_time
        #
        def find_by_one_time one_time
          GoTransverseTractApi.get_response_for(self, {one_time: one_time})
        end

        #
        # @param {Boolean} recurring
        #
        def find_by_recurring recurring
          GoTransverseTractApi.get_response_for(self, {recurring: recurring})
        end

        #
        # @param {String} currency_type
        #
        def find_by_currency_type currency_type
          GoTransverseTractApi.get_response_for(self, {currency_type: currency_type})
        end

      end

    end

  end

end
