module GoTransverseTractApi

  module BillingAccount

    class AdjustmentReason

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
        # @param {String} name
        #
        def find_by_name name
          GoTransverseTractApi.get_response_for(self, {name: name})
        end

        #
        # @param {String} status
        #
        def find_by_status status
          GoTransverseTractApi.get_response_for(self, {status: status})
        end

        #
        # @param {Boolean} credit_only
        #
        def find_by_credit_only credit_only
          GoTransverseTractApi.get_response_for(self, {credit_only: credit_only})
        end

      end

    end

  end

end
