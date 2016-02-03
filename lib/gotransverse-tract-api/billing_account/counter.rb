module GoTransverseTractApi

  module BillingAccount

    class Counter

      class << self

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {Long} service_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_service_eid service_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {service_eid: service_eid, queryScope: query_scope})
        end

        #
        # @param {String} name
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_name name, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {name: name, queryScope: query_scope})
        end

        #
        # @param {String} status
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_status status, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {status: status, queryScope: query_scope})
        end

        #
        # @param {String} type
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_type type, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {type: type, queryScope: query_scope})
        end

        #
        # @param {String} entity_relation_type
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_entity_relation_type entity_relation_type, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {entity_relation_type: entity_relation_type, queryScope: query_scope})
        end

        #
        # @param {DateTime} from_date
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_from_date from_date, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {from_date: from_date, queryScope: query_scope})
        end

        #
        # @param {DateTime} thru_date
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_thru_date thru_date, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {thru_date: thru_date, queryScope: query_scope})
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
