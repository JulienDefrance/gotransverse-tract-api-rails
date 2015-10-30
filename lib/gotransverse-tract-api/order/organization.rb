module GoTransverseTractApi

  module Order

    class Organization

      def self.find_all
        GoTransverseTractApi.get_response_for(self.class)
      end

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self.class, {eid: eid})
      end

      #
      # @param {String} name
      #
      def self.find_by_name name
        GoTransverseTractApi.get_response_for(self.class, {name: name})
      end

      #
      # @param {Long} billing_account_eid
      #
      def self.find_by_billing_account_eid billing_account_eid
        GoTransverseTractApi.get_response_for(self.class, {billing_account_eid: billing_account_eid})
      end

    end

  end

end