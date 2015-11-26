module GoTransverseTractApi

  module Usage

    class RateTable

      class << self

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

      end

    end

  end

end
