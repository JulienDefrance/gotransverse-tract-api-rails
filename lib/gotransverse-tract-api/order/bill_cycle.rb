module GoTransverseTractApi

  module Order

    class BillCycle

      class << self

        #
        # @param {Hash} options
        #
        def find_all options={}
          params ||= GoTransverseTractApi::ApiData.new.get_query_params({}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} eid
        # @param {Hash} options
        #
        def find_by_eid eid, options={}
          return nil unless eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} name
        # @param {Hash} options
        #
        def find_by_name name, options={}
          return nil unless name.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({name: name}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} type
        # @param {Hash} options
        #
        def find_by_type type, options={}
          return nil unless type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({type: type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} status
        # @param {Hash} options
        #
        def find_by_status status, options={}
          return nil unless status.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({status: status}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} currency_type
        # @param {Hash} options
        #
        def find_by_currency_type currency_type, options={}
          return nil unless currency_type.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({currency_type: currency_type}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
