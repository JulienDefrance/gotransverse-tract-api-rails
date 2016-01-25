module GoTransverseTractApi

  module Order

    class AgreementConfiguration

      def self.get_agreement_conf agreement_conf
        {
          nextAgreement: agreement_conf[:next_agreement],
          nextServiceProduct: agreement_conf[:next_service_product],
          nextServiceProductPrice: agreement_conf[:next_service_product_price],
          endDate: agreement_conf[:end_date],
          endAction: agreement_conf[:end_action],
          nextEndAction: agreement_conf[:next_end_action],
          preserveServicePrice: agreement_conf[:preserve_service_price],
          nextPreserveServicePrice: agreement_conf[:next_preserve_service_price]
        }.delete_if{|k,v| v.nil?}
      end

    end

  end

end
