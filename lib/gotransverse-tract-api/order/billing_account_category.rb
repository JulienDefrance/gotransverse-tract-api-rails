module GoTransverseTractApi

  module Order

    class BillingAccountCategory

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
        # @param {String} desc
        #
        def find_by_desc desc
          GoTransverseTractApi.get_response_for(self, {desc: desc})
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
