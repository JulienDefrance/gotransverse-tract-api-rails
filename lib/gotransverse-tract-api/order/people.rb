module GoTransverseTractApi

  module Order

    class People

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
      # @param {String} first_name
      # @param {Hash} options
      #
      def self.find_by_first_name first_name, options={}
        return nil unless first_name.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({first_name: first_name}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {String} last_name
      # @param {Hash} options
      #
      def self.find_by_last_name last_name, options={}
        return nil unless last_name.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({last_name: last_name}, options)
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
      # @param {Hash} people
      #
      def self.update eid, people
        data = {
          person: {
            eid: eid,
            name: people[:name],
            taxIdNumber: people[:tax_id_number]
          }
        }

        xml_data = GoTransverseTractApi.generateXML(data, 'person')
        GoTransverseTractApi.put_request_for(self, {eid: eid}, xml_data)
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

    end

  end

end
