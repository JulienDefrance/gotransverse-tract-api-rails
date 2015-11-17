module GoTransverseTractApi

  module BillingAccount

    class CustomField

      def self.find_all
        GoTransverseTractApi.get_response_for(self)
      end

    end

  end

end