module GoTransverseTractApi

  module BillingAccount

    class ScheduledCharge

      class << self

        #
        # @param {Hash} options
        #
        def find_all options={}
          params ||= GoTransverseTractApi::ApiData.new.get_query_params({}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

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
        # @param {Long} service_price_eid
        # @param {Hash} options
        #
        def find_by_service_price_eid service_price_eid, options={} 
          return nil unless service_price_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({service_price_eid: service_price_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Boolean} invoiced
        # @param {Hash} options
        #
        def find_by_invoiced invoiced, options={} 
          return nil unless invoiced.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({invoiced: invoiced}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} order_item_eid
        # @param {Hash} options
        #
        def find_by_order_item_eid order_item_eid, options={} 
          return nil unless order_item_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({order_item_eid: order_item_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
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
