module GoTransverseTractApi

  module Order

    class Organization

      def self.find_all
        GoTransverseTractApi.get_response_for(self)
      end

      #
      # @param {Long} eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_eid eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
      end

      #
      # @param {String} name
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_name name, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {name: name, queryScope: query_scope})
      end

      #
      # @param {Long} billing_account_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_billing_account_eid billing_account_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid, queryScope: query_scope})
      end

      #
      # @param {Long} eid
      # @param {Hash} address
      #
      def self.add_address eid, address
        data = {
          addAddressToParty: {},
          person: {eid: eid},
          postalAddress: {
            purpose: address[:purpose],
            country: address[:country],
            city: address[:city],
            regionOrState: address[:region_or_state],
            postalCode: address[:postal_code],
            line1: address[:line1]
          }
        }

        xml_data = GoTransverseTractApi.generateXML(data, 'addAddressToParty')
        GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "addAddress")
      end

      #
      # @param {Long} eid
      # @param {Hash} organization
      #
      def self.update eid, organization
        GoTransverseTractApi.put_request_for(self, {eid: eid}, organization)
      end

    end

  end

end
