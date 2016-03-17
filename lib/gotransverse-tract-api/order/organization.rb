module GoTransverseTractApi

  module Order

    class Organization

      #
      # @param {Hash} options
      #
      def self.find_all options={}
        params ||= GoTransverseTractApi::ApiData.new.get_query_params({}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} eid
      # @param {Hash} options
      #
      def self.find_by_eid eid, options={}
        return nil unless eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {String} name
      # @param {Hash} options
      #
      def self.find_by_name name, options={}
        return nil unless name.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({name: name}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} billing_account_eid
      # @param {Hash} options
      #
      def self.find_by_billing_account_eid billing_account_eid, options={}
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
          postal_address = GoTransverseTractApi::ApiData.new.get_postal_address(address[:postal_address])
          data.merge!(postal_address)
        end

        if (address.has_key?(:email_address))
          email_address = GoTransverseTractApi::ApiData.new.get_email_address(address[:email_address])
          data.merge!(email_address)
        end

        if (address.has_key?(:telecom_address))
          telecom_address = GoTransverseTractApi::ApiData.new.get_telecom_address(address[:telecom_address])
          data.merge!(telecom_address)
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
