module GoTransverseTractApi

  module BillingAccount

    class CustomField

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
        # @param {String} type
        #
        def find_by_type type
          GoTransverseTractApi.get_response_for(self, {type: type})
        end

        #
        # @param {Boolean} enabled
        #
        def find_by_enabled enabled
          GoTransverseTractApi.get_response_for(self, {enabled: enabled})
        end

        #
        # @param {Boolean} searchable
        #
        def find_by_searchable searchable
          GoTransverseTractApi.get_response_for(self, {searchable: searchable})
        end

      end

    end

  end

end
