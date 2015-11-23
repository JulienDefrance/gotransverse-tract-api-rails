module GoTransverseTractApi

  module Product

    class OneTimeProductPrice < ProductPrice

      class << self
        
        #
        # @param {Boolean} charge_during_renewal
        #
        def find_by_charge_during_renewal charge_during_renewal
          GoTransverseTractApi.get_response_for(self, {charge_during_renewal: charge_during_renewal})
        end
      end

    end

  end

end
