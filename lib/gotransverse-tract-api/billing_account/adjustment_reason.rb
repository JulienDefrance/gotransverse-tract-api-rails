module GoTransverseTractApi

  module BillingAccount

    class AdjustmentReason

      def self.find_all
        GoTransverseTractApi.get_response_for(self)
      end

    end

  end

end