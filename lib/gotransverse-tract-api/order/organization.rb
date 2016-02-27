module GoTransverseTractApi

  module Order

    class Organization

      #
      # @param {Hash} options
      #
      def self.find_all options=nil
        params ||= GoTransverseTractApi::ApiData.new.get_query_params({}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} eid
      # @param {Hash} options
      #
      def self.find_by_eid eid, options=nil
        return nil unless eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {String} name
      # @param {Hash} options
      #
      def self.find_by_name name, options=nil
        return nil unless name.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({name: name}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} billing_account_eid
      # @param {Hash} options
      #
      def self.find_by_billing_account_eid billing_account_eid, options=nil
        return nil unless billing_account_eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({billing_account_eid: billing_account_eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
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
