module GoTransverseTractApi

  module Usage

    class UsageEvent

      class << self

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
        # @param {Long} billing_account_eid
        # @param {Hash} options
        #
        def find_by_billing_account_eid billing_account_eid, options=nil
          return nil unless billing_account_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({billing_account_eid: billing_account_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} account_num
        # @param {Hash} options
        #
        def find_by_account_num account_num, options=nil
          return nil unless account_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({account_num: account_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} service_period_eid
        # @param {Hash} options
        #
        def find_by_service_period_eid service_period_eid, options=nil
          return nil unless service_period_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({service_period_eid: service_period_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} service_resource_identifier
        # @param {Hash} options
        #
        def find_by_service_resource_identifier service_resource_identifier, options=nil
          return nil unless service_resource_identifier.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({service_resource_identifier: service_resource_identifier}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {DateTime} start_time
        # @param {Hash} options
        #
        def find_by_start_time start_time, options=nil
          return nil unless start_time.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({start_time: start_time}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {DateTime} end_time
        # @param {Hash} options
        #
        def find_by_end_time end_time, options=nil
          return nil unless end_time.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({end_time: end_time}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} reference_id
        # @param {Hash} options
        #
        def find_by_reference_id reference_id, options=nil
          return nil unless reference_id.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({reference_id: reference_id}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Hash} usage_event
        #
        def simulate usage_event
          data = {
            simulateUsageEvent: {},
            usageEvent: {
              attributes: get_usage_event(usage_event),
              serviceResourceType: usage_event[:service_resource_type]
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'simulateUsageEvent')
          GoTransverseTractApi.post_request_for(self, xml_data, "simulate")
        end

        #
        # @param {Hash} usage_event
        #
        def create_usage_event usage_event
          data = {
            usageEvent: {
              attributes: get_usage_event(usage_event),
              serviceResourceType: usage_event[:service_resource_type]
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'usageEvent')
          GoTransverseTractApi.post_request_for(self, xml_data, "")
        end

        #
        # @param {Hash} usage_event
        #
        def bulk usage_event
          data = {
            bulkUsageEvents: {},
            usageEvents: get_usage_events(usage_event)
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'bulkUsageEvents')
          GoTransverseTractApi.post_request_for(self, {}, xml_data, "bulk")
        end

        #
        # @param {Hash} usage_event
        #
        def void_event usage_event
          
          data = {
            voidUsageEvent: {},
            usageEvent: {
              eid: usage_event[:eid]
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'voidUsageEvent')
          GoTransverseTractApi.post_request_for(self, usage_event, "void_event")
        end

        private

        #
        # params: [Array] Usage Events
        #
        # Returns [Array] of usage events for XML
        #
        def get_usage_events(usage_event)
          events = []

          usage_event.each do|event|
            events << {
              usageEvent: {
                attributes: get_usage_event(event),
                serviceResourceType: event[:service_resource_type]
              }
            }
          end

          events      
        end

        #
        # params: Usage Event
        #
        # Returns A single usage event for XML
        #
        def get_usage_event(event)
          udfs = {}

          (1..5).each do|i|
            udfs["text0#{i}".to_sym] = event["text0#{i}".to_sym]
            udfs["number0#{i}".to_sym] = event["number0#{i}".to_sym]
            udfs["date0#{i}".to_sym] = event["date0#{i}".to_sym]
          end

          ({ 
            description: event[:description],
            startTime: event[:start_time],
            endTime: event[:end_time],
            serviceResourceId: event[:service_resource_id],
            usageUom: event[:usage_uom],
            usageAmount: event[:usage_amount],
            referenceId: event[:reference_id],
            sequenceId: event[:sequence_id]
          }.merge udfs).delete_if{|k,v| v.nil?}
        end

      end

    end

  end

end
