module GoTransverseTractApi

  module Product

    class OneTimeProductPrice < ProductPrice

      class << self
        
        #
        # @param {Boolean} charge_during_renewal
        # @param {String} query_scope (default: 'SHALLOW')
        #
        def find_by_charge_during_renewal charge_during_renewal, query_scope=nil
          GoTransverseTractApi.get_response_for(self, {charge_during_renewal: charge_during_renewal, queryScope: query_scope})
        end
      end

    end

  end

end
