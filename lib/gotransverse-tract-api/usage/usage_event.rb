module GoTransverseTractApi

  module Usage

    class UsageEvent

      class << self

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} billing_account_eid
        # @param {Boolean} closed
        #
        def find_by_billing_account_eid billing_account_eid, closed
          GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid, closed: closed})
        end

        #
        # @param {Long} account_num
        # @param {Boolean} closed
        #
        def find_by_account_num account_num, closed
          GoTransverseTractApi.get_response_for(self, {account_num: account_num, closed: closed})
        end

        #
        # @param {Long} service_period_eid
        #
        def find_by_service_period_eid service_period_eid
          GoTransverseTractApi.get_response_for(self, {service_period_eid: service_period_eid})
        end

        #
        # @param {Long} service_resource_identifier
        #
        def find_by_service_resource_identifier service_resource_identifier
          GoTransverseTractApi.get_response_for(self, {service_resource_identifier: service_resource_identifier})
        end

        #
        # @param {DateTime} start_time
        #
        def find_by_start_time start_time
          GoTransverseTractApi.get_response_for(self, {start_time: start_time})
        end

        #
        # @param {DateTime} end_time
        #
        def find_by_end_time end_time
          GoTransverseTractApi.get_response_for(self, {end_time: end_time})
        end

        #
        # @param {Long} reference_id
        # @param {Long} sequence_id (optional)
        #
        def find_by_reference_id reference_id, sequence_id=nil
          GoTransverseTractApi.get_response_for(self, {reference_id: reference_id, sequence_id: sequence_id})
        end

        #
        # @param {Hash} usage_event
        #
        def create_usage_event usage_event
          data = {
            :usageEvent => {
              :startTime => usage_event[:start_time],
              :serviceResourceId => usage_event[:service_resource_id],
              :usageUom => usage_event[:usage_uom],
              :usageAmount => usage_event[:usage_amount],
              :number01 => usage_event[:number01]
            },
            :serviceResourceType => 'GENERICSRVCRESOURCE'
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'usageEvent')
          GoTransverseTractApi.post_request_for(self, xml_data, "")
        end

        #
        # @param {Hash} usage_event
        #
        def bulk usage_event
          GoTransverseTractApi.post_request_for(self, {}, usage_event, "bulk")
        end

        #
        # @param {Hash} usage_event
        #
        def void_event usage_event
          
          data = {
            :voidUsageEvent => {},
            :usageEvent => {
              :eid => usage_event[:eid]
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'voidUsageEvent')
          GoTransverseTractApi.post_request_for(self, usage_event, "void_event")
        end

      end

    end

  end

end
