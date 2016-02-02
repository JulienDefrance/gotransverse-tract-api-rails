module GoTransverseTractApi

  module Order

    class Agreement

      class << self
        def find_all
          GoTransverseTractApi.get_response_for(self)
        end

        #
        # @param {Long} eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_eid eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
        end

        #
        # @param {String} name
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_name name, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {name: name, queryScope: query_scope})
        end

        #
        # @param {Long} product_eid
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_product_eid product_eid, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {product_eid: product_eid, queryScope: query_scope})
        end

        #
        # @param {String} status
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_status status, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {status: status, queryScope: query_scope})
        end

        #
        # @param {String} termination_fee_currency_type
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_termination_fee_currency_type termination_fee_currency_type, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {termination_fee_currency_type: termination_fee_currency_type, queryScope: query_scope})
        end

        #
        # @param {String} max_termination_fee_currency_type
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_max_termination_fee_currency_type max_termination_fee_currency_type, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {max_termination_fee_currency_type: max_termination_fee_currency_type, queryScope: query_scope})
        end

        #
        # @param {Date} from_date
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_from_date from_date, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {from_date: from_date, queryScope: query_scope})
        end

        #
        # @param {Date} thru_date
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_thru_date thru_date, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {thru_date: thru_date, queryScope: query_scope})
        end

        #
        # @param {Hash} agreement
        #
        def get_selected_agreement agreement
          {
            eid: agreement[:eid]
          }
        end
      end
    end

  end

end
