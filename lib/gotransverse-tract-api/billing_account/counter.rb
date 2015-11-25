module GoTransverseTractApi

  module BillingAccount

    class Counter

      class << self

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} service_eid
        #
        def find_by_service_eid service_eid
          GoTransverseTractApi.get_response_for(self, {service_eid: service_eid})
        end

        #
        # @param {String} name
        #
        def find_by_name name
          GoTransverseTractApi.get_response_for(self, {name: name})
        end

        #
        # @param {String} status
        #
        def find_by_status status
          GoTransverseTractApi.get_response_for(self, {status: status})
        end

        #
        # @param {String} type
        #
        def find_by_type type
          GoTransverseTractApi.get_response_for(self, {type: type})
        end

        #
        # @param {String} entity_relation_type
        #
        def find_by_entity_relation_type entity_relation_type
          GoTransverseTractApi.get_response_for(self, {entity_relation_type: entity_relation_type})
        end

        #
        # @param {DateTime} from_date
        #
        def find_by_from_date from_date
          GoTransverseTractApi.get_response_for(self, {from_date: from_date})
        end

        #
        # @param {DateTime} thru_date
        #
        def find_by_thru_date thru_date
          GoTransverseTractApi.get_response_for(self, {thru_date: thru_date})
        end

        #
        # @param {Long} eid
        # @param {Hash} counter
        #
        def update eid, counter
          GoTransverseTractApi.put_request_for(self, {eid: eid}, counter)
        end

      end

    end

  end

end
