module GoTransverseTractApi

  module Order

    class Agreement

      class << self

        #
        # @param {Hash} options
        #
        def find_all options=nil
          params ||= GoTransverseTractApi::ApiData.new.get_query_params({}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} eid
        # @param {Hash} options
        #
        def find_by_eid eid, options=nil
          return nil unless eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} name
        # @param {Hash} options
        #
        def find_by_name name, options=nil
          return nil unless name.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({name: name}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} product_eid
        # @param {Hash} options
        #
        def find_by_product_eid product_eid, options=nil
          return nil unless product_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_eid: product_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} status
        # @param {Hash} options
        #
        def find_by_status status, options=nil
          return nil unless status.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({status: status}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} termination_fee_currency_type
        # @param {Hash} options
        #
        def find_by_termination_fee_currency_type termination_fee_currency_type, options=nil
          return nil unless termination_fee_currency_type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({termination_fee_currency_type: termination_fee_currency_type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} max_termination_fee_currency_type
        # @param {Hash} options
        #
        def find_by_max_termination_fee_currency_type max_termination_fee_currency_type, options=nil
          return nil unless max_termination_fee_currency_type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({max_termination_fee_currency_type: max_termination_fee_currency_type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Date} from_date
        # @param {Hash} options
        #
        def find_by_from_date from_date, options=nil
          return nil unless from_date.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({from_date: from_date}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Date} thru_date
        # @param {Hash} options
        #
        def find_by_thru_date thru_date, options=nil
          return nil unless thru_date.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({thru_date: thru_date}, options)
          GoTransverseTractApi.get_response_for(self, params)
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
