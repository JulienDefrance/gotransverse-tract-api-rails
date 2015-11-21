module GoTransverseTractApi

  module Order

    class PaymentTerm

      class << self

        def find_all
          GoTransverseTractApi.get_response_for(self)
        end

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} billing_account_category_eid
        #
        def find_by_billing_account_category_eid billing_account_category_eid
          GoTransverseTractApi.get_response_for(self, {billing_account_category_eid: billing_account_category_eid})
        end

        #
        # @param {Long} billing_account_eid
        #
        def find_by_billing_account_eid billing_account_eid
          GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid})
        end

        #
        # @param {String} name
        #
        def find_by_name name
          GoTransverseTractApi.get_response_for(self, {name: name})
        end

      end

    end

  end

end
