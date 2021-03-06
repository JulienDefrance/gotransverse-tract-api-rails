module GoTransverseTractApi

  module BillingAccount

    class CustomField

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
        # @param {Boolean} enabled
        # @param {Hash} options
        #
        def find_by_enabled enabled, options={}
          return nil unless enabled.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({enabled: enabled}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Boolean} searchable
        # @param {Hash} options
        #
        def find_by_searchable searchable, options={}
          return nil unless searchable.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({searchable: searchable}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

  end

end
