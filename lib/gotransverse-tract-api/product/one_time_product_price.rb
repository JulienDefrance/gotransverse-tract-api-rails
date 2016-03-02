module GoTransverseTractApi

  module Product

    class OneTimeProductPrice < ProductPrice

      class << self
        
        #
        # @param {Boolean} charge_during_renewal
        # @param {Hash} options
        #
        def find_by_charge_during_renewal charge_during_renewal, options=nil
          return nil unless charge_during_renewal.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({charge_during_renewal: charge_during_renewal}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end
      end

    end

  end

end
