module GoTransverseTractApi

  module BillingAccount

    class ScheduledCharge

      class << self

        def find_all
          GoTransverseTractApi.get_response_for(self)
        end

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil 
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} service_price_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_service_price_eid service_price_eid, query_scope=nil 
          GoTransverseTractApi.get_response_for(self, {service_price_eid: service_price_eid, queryScope: query_scope})
        end

        #
        # @param {Boolean} invoiced
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_invoiced invoiced, query_scope=nil 
          GoTransverseTractApi.get_response_for(self, {invoiced: invoiced, queryScope: query_scope})
        end

        #
        # @param {Long} order_item_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_order_item_eid order_item_eid, query_scope=nil 
          GoTransverseTractApi.get_response_for(self, {order_item_eid: order_item_eid, queryScope: query_scope})
        end

        #
        # @param {Hash} scheduled_charges
        #
        def self.get_scheduled_charges scheduled_charges
          sch_charges = {
            attributes: api_data.get_page_info(scheduled_charges),
            scheduleCharge: {
              eid: scheduled_charges[:eid],
              description: scheduled_charges[:description],
              amount: scheduled_charges[:amount],
              invoiced: scheduled_charges[:invoiced],
              chargeDate: scheduled_charges[:charge_date]
            }
          }

          sch_charges.delete_if{|k,v| v.nil?}
        end
      end

    end

  end

end
