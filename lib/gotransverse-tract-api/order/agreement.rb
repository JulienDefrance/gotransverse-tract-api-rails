module GoTransverseTractApi

  module Order

    class Agreement

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
        # @param {Long} product_eid
        #
        def find_by_product_eid product_eid
          GoTransverseTractApi.get_response_for(self, {product_eid: product_eid})
        end

        #
        # @param {String} status
        #
        def find_by_status status
          GoTransverseTractApi.get_response_for(self, {status: status})
        end

        #
        # @param {String} termination_fee_currency_type
        #
        def find_by_termination_fee_currency_type termination_fee_currency_type
          GoTransverseTractApi.get_response_for(self, {termination_fee_currency_type: termination_fee_currency_type})
        end

        #
        # @param {String} max_termination_fee_currency_type
        #
        def find_by_max_termination_fee_currency_type max_termination_fee_currency_type
          GoTransverseTractApi.get_response_for(self, {max_termination_fee_currency_type: max_termination_fee_currency_type})
        end

        #
        # @param {Date} from_date
        #
        def find_by_from_date from_date
          GoTransverseTractApi.get_response_for(self, {from_date: from_date})
        end

        #
        # @param {Date} thru_date
        #
        def find_by_thru_date thru_date
          GoTransverseTractApi.get_response_for(self, {thru_date: thru_date})
        end

      end
    end

  end

end
