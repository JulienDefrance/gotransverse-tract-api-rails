module GoTransverseTractApi

  module Order

    class ProductRelation

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
        # @param {Long} product_eid
        # @param {Hash} options
        #
        def find_by_product_eid product_eid, options={}
          return nil unless product_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_eid: product_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} type
        # @param {Hash} options
        #
        def find_by_type type, options={}
          return nil unless type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({type: type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
