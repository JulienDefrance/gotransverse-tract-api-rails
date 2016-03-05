module GoTransverseTractApi

  module Product

    class Discount < DiscountCategory

      class << self
        
        #
        # @param {String} type
        # @param {Hash} options
        #
        def find_by_type type, options={}
          return nil unless type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({type: type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} discount_category_eid
        # @param {Hash} options
        #
        def find_by_discount_category_eid discount_category_eid, options={}
          return nil unless discount_category_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({discount_category_eid: discount_category_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end
       
        #
        # @param {Boolean} one_time
        # @param {Hash} options
        #
        def find_by_one_time one_time, options={}
          return nil unless one_time.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({one_time: one_time}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Boolean} recurring
        # @param {Hash} options
        #
        def find_by_recurring recurring, options={}
          return nil unless recurring.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({recurring: recurring}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} currency_type
        # @param {Hash} options
        #
        def find_by_currency_type currency_type, options={}
          return nil unless currency_type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({currency_type: currency_type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
