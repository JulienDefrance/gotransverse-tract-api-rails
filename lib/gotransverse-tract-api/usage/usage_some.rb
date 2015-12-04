module GoTransverseTractApi

  module Usage

    class UsageSome 
      include UsageMain

      class << self

        #
        # @param {Long} billing_account_eid
        # @param {Boolean} closed
        #
        def find_by_billing_account_eid billing_account_eid, closed
          GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid, closed: closed})
        end

      end
      
    end

  end

end
