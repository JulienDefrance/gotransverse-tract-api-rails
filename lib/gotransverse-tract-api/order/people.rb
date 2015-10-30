module GoTransverseTractApi

  module Order

    class People

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
      # @param {String} first_name
      #
      def self.find_by_first_name first_name
        GoTransverseTractApi.get_response_for(self.class, {first_name: first_name})
      end

      #
      # @param {String} last_name
      #
      def self.find_by_last_name last_name
        GoTransverseTractApi.get_response_for(self.class, {last_name: last_name})
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