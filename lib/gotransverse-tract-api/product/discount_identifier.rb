module GoTransverseTractApi

  module Product

    class DiscountIdentifier

      class << self

        #
        # @param {Hash} options
        #
        def find_all options=nil
          params ||= GoTransverseTractApi::ApiData.new.get_query_params({}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} eid
        # @param {Hash} options
        #
        def find_by_eid eid, options=nil
          return nil unless eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} identifier
        # @param {Hash} options
        #
        def find_by_identifier identifier, options=nil
          return nil unless identifier.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({identifier: identifier}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} order_item_eid
        # @param {Hash} options
        #
        def find_by_order_item_order_item_eid order_item_order_item_eid, options=nil
          return nil unless order_item_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({order_item_eid: order_item_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
