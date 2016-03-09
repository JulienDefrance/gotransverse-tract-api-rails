module GoTransverseTractApi

  module Order

    class Agreement < Common::Base

      class << self

        #
        # @param {Long} product_eid
        # @param {Hash} options
        #
        def find_by_product_eid product_eid, options={}
          return nil unless product_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_eid: product_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} termination_fee_currency_type
        # @param {Hash} options
        #
        def find_by_termination_fee_currency_type termination_fee_currency_type, options={}
          return nil unless termination_fee_currency_type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({termination_fee_currency_type: termination_fee_currency_type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} max_termination_fee_currency_type
        # @param {Hash} options
        #
        def find_by_max_termination_fee_currency_type max_termination_fee_currency_type, options={}
          return nil unless max_termination_fee_currency_type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({max_termination_fee_currency_type: max_termination_fee_currency_type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Date} from_date
        # @param {Hash} options
        #
        def find_by_from_date from_date, options={}
          return nil unless from_date.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({from_date: from_date}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Date} thru_date
        # @param {Hash} options
        #
        def find_by_thru_date thru_date, options={}
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
