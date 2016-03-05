module GoTransverseTractApi

  module BillingAccount

    class Counter

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
        # @param {Long} service_eid
        # @param {Hash} options
        #
        def find_by_service_eid service_eid, options={}
          return nil unless service_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({service_eid: service_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} name
        # @param {Hash} options
        #
        def find_by_name name, options={}
          return nil unless name.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({name: name}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} status
        # @param {Hash} options
        #
        def find_by_status status, options={}
          return nil unless status.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({status: status}, options)
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

        #
        # @param {String} entity_relation_type
        # @param {Hash} options
        #
        def find_by_entity_relation_type entity_relation_type, options={}
          return nil unless entity_relation_type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({entity_relation_type: entity_relation_type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Date} from_date
        # @param {Hash} options
        #
        def find_by_from_date from_date, options={}
          return nil unless from_date.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({from_date: from_date}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Date} thru_date
        # @param {Hash} options
        #
        def find_by_thru_date thru_date, options={}
          return nil unless thru_date.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({thru_date: thru_date}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} eid
        # @param {Hash} counter
        #
        def update_usage_charge eid, counter
          xml_data = get_data_struct(counter, 'usageChargeCounter')
          GoTransverseTractApi.put_request_for(self, {eid: eid}, xml_data)
        end

        #
        # @param {Long} eid
        # @param {Hash} counter
        #
        def update_usage_event eid, counter
          xml_data = get_data_struct(counter, 'usageEventCounter')
          GoTransverseTractApi.put_request_for(self, {eid: eid}, xml_data)
        end

        #
        # @param {Long} eid
        # @param {Hash} counter
        #
        def update_usage_rule eid, counter
          xml_data = get_data_struct(counter, 'usageRuleCounter')
          GoTransverseTractApi.put_request_for(self, {eid: eid}, xml_data)
        end

        private

        def get_data_struct(counter, root_elem)
          root_elem =~ /usage(.*?)Counter/
          child_attr = $1.downcase

          data = {
            "#{root_elem}": {
              eid: counter[:eid],
              charge: counter["#{child_attr}".to_sym]
            }
          }

          GoTransverseTractApi.generateXML(data, root_elem)
        end

      end

    end

  end

end
