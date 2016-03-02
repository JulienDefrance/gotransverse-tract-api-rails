module GoTransverseTractApi

  module Usage

    class UsageLookupTableEntry

      class << self

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
        # @param {Long} usage_lookup_table_eid
        # @param {Hash} options
        #
        def find_by_usage_lookup_table_usage_lookup_table_eid usage_lookup_table_usage_lookup_table_eid, options=nil
          return nil unless usage_lookup_table_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({usage_lookup_table_eid: usage_lookup_table_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} key
        # @param {Hash} options
        #
        def find_by_key key, options=nil
          return nil unless key.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({key: key}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} value
        # @param {Hash} options
        #
        def find_by_value value, options=nil
          return nil unless value.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({value: value}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
