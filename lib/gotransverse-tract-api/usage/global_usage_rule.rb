module GoTransverseTractApi

  module Usage

    class GlobalUsageRule

      class << self

        def find_by_all 
          GoTransverseTractApi.get_response_for(self)
        end

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Boolean} is_global
        #
        def find_by_is_global is_global
          GoTransverseTractApi.get_response_for(self, {is_global: is_global})
        end

        #
        # @param {String} status
        #
        def find_by_status status
          GoTransverseTractApi.get_response_for(self, {status: status})
        end

      end

    end

  end

end
