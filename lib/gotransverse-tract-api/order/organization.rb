module GoTransverseTractApi

  module Order

    class Organization

      def self.find_all
        GoTransverseTractApi.get_response_for(self)
      end

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self, {eid: eid})
      end

      #
      # @param {String} name
      #
      def self.find_by_name name
        GoTransverseTractApi.get_response_for(self, {name: name})
      end

      #
      # @param {Long} billing_account_eid
      #
      def self.find_by_billing_account_eid billing_account_eid
        GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid})
      end

      #
      # @param {Long} eid
      # @param {Nokogiri::XML::Document} address
      #
      def self.add_address eid, address
        GoTransverseTractApi.post_request_for(self, {eid: eid}, address.to_s, "addAddress")
      end

      #
      # @param {Long} eid
      # @param {Nokogiri::XML::Document} organization
      #
      def self.update eid, organization
        GoTransverseTractApi.put_request_for(self, {eid: eid}, organization.to_s)
      end

    end

  end

end
