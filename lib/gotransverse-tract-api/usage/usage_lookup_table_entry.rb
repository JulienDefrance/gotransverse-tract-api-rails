module GoTransverseTractApi

  module Usage

    class UsageLookupTableEntry

      class << self

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} usage_lookup_table_eid
        #
        def find_by_usage_lookup_table_eid usage_lookup_table_eid
          GoTransverseTractApi.get_response_for(self, {usage_lookup_table_eid: usage_lookup_table_eid})
        end

        #
        # @param {String} key
        #
        def find_by_key key
          GoTransverseTractApi.get_response_for(self, {key: key})
        end

        #
        # @param {String} value
        #
        def find_by_value value
          GoTransverseTractApi.get_response_for(self, {value: value})
        end

      end

    end

  end

end
