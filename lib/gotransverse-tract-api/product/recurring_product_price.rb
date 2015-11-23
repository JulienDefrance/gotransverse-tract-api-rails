module GoTransverseTractApi

  module Product

    class RecurringProductPrice < ProductPrice

      class << self

        #
        # @param {Long} recurrence_period
        #
        def find_by_recurrence_period recurrence_period
          GoTransverseTractApi.get_response_for(self, {recurrence_period: recurrence_period})
        end

        #
        # @param {Long} recurrence_amount
        #
        def find_by_recurrence_amount recurrence_amount
          GoTransverseTractApi.get_response_for(self, {recurrence_amount: recurrence_amount})
        end

        #
        # @param {Boolean} recurring_payment_required
        #
        def find_by_recurring_payment_required recurring_payment_required
          GoTransverseTractApi.get_response_for(self, {recurring_payment_required: recurring_payment_required})
        end

        #
        # @param {Boolean} bill_in_advance
        #
        def find_by_bill_in_advance bill_in_advance
          GoTransverseTractApi.get_response_for(self, {bill_in_advance: bill_in_advance})
        end

        #
        # @param {Boolean} prorated_on_cancel
        #
        def find_by_prorated_on_cancel prorated_on_cancel
          GoTransverseTractApi.get_response_for(self, {prorated_on_cancel: prorated_on_cancel})
        end

        #
        # @param {Boolean} prorated_on_order
        #
        def find_by_prorated_on_order prorated_on_order
          GoTransverseTractApi.get_response_for(self, {prorated_on_order: prorated_on_order})
        end

        #
        # @param {Boolean} prorated_on_order_no_charge
        #
        def find_by_prorated_on_order_no_charge prorated_on_order_no_charge
          GoTransverseTractApi.get_response_for(self, {prorated_on_order_no_charge: prorated_on_order_no_charge})
        end

      end

    end

  end

end
