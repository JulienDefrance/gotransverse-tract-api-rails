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
        }

        if (address.has_key?(:person))
          data.merge!({ person: {eid: eid} })
        else
          data.merge!({ organization: {eid: eid} })
        end

        if (address.has_key?(:postal_address))
          postal_address = {
              postalAddress: {
                  purpose: address[:postal_address][:purpose],
                  country: address[:postal_address][:country],
                  city: address[:postal_address][:city],
                  regionOrState: address[:postal_address][:region_or_state],
                  attention: address[:postal_address][:attention],
                  postalCode: address[:postal_address][:postal_code],
                  line1: address[:postal_address][:line1],
              }.delete_if{|k,v| v.nil?}
          }.delete_if{|k,v| v.nil?}

          data.merge!({ postalAddress: postal_address[:postalAddress] })
        end
        if (address.has_key?(:email_address))
          data.merge!({ emailAddress: address[:email_address] })
        end
        if (address.has_key?(:telecom_address))
          data.merge!({ telecomAddress: address[:telecom_address] })
        end

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
