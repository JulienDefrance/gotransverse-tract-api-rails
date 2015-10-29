module GoTransverseTractApi

  module BillingAccount

    class CustomFieldValue

      def self.find_all
        GoTransverseTractApi.get_response_for(self.class)
      end

    end

  end

end