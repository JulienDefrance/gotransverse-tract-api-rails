module GoTransverseTractApi

  module Order

    class DiscountConfiguration

      def self.get_discount_configurations discount_configurations
        disc_configurations = {
          attributes: {},
          discountConfiguration: {
            attributes: {},
            discountIdentifier: {
              eid: discount_configurations[:discount_configuration][:discount_identifier][:eid]
            }
          }
        }

        disc_configurations
      end

    end

  end

end
            #overrideAmount: discount_configurations[:override_amount],
            #overridePercentage: discount_configurations[:override_percentage],
            #overrideDuration: discount_configurations[:override_duration]
