module GoTransverseTractApi

  module Order

    class People

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
      # @param {String} first_name
      #
      def self.find_by_first_name first_name
        GoTransverseTractApi.get_response_for(self, {first_name: first_name})
      end

      #
      # @param {String} last_name
      #
      def self.find_by_last_name last_name
        GoTransverseTractApi.get_response_for(self, {last_name: last_name})
      end

      #
      # @param {Long} billing_account_eid
      #
      def self.find_by_billing_account_eid billing_account_eid
        GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid})
      end

      #
      # @param {Long} eid
      # @param {Hash} people
      #
      def self.update eid, people
        GoTransverseTractApi.put_request_for(self, {eid: eid}, people)
      end

      #
      # @param {Long} eid
      # @param {Hash} address
      #
      def self.add_address eid, address
        GoTransverseTractApi.post_request_for(self, {eid: eid}, address, "addAddress")
      end

      #
      # @param {Long} eid
      # @param {Hash} person
      #
      def self.add_person eid, person
        GoTransverseTractApi.post_request_for(self, {eid: eid}, person, "addPerson")
      end

      #
      # @param {Long} eid
      # @param {Hash} person
      #
      def self.remove_person eid, person
        GoTransverseTractApi.post_request_for(self, {eid: eid}, person, "removePerson")
      end

    end

  end

end
