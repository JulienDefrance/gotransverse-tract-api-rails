module GoTransverseTractApi

  module Order

    class PartyCategory < Common::Base

      #
      # @param {String} description
      # @param {Hash} options
      #
      def self.find_by_description description, options={}
        return nil unless description.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({description: description}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

    end

  end

end
