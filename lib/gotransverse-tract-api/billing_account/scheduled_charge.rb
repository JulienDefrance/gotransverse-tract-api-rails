module GoTransverseTractApi

  module BillingAccount

    class ScheduledCharge

      class << self

        def find_all
          GoTransverseTractApi.get_response_for(self)
        end

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} service_price_eid
        #
        def find_by_service_price_eid service_price_eid
          GoTransverseTractApi.get_response_for(self, {service_price_eid: service_price_eid})
        end

        #
        # @param {Boolean} invoiced
        #
        def find_by_invoiced invoiced
          GoTransverseTractApi.get_response_for(self, {invoiced: invoiced})
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
