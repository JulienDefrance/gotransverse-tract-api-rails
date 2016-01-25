module GoTransverseTractApi

  module Order

    class UsageRate

      class << self
        def get_usage_rate(usage_rate)
          usage_rates = {
            attributes: {},
            flatUsageRate: {
              attributes: {
                eid: usage_rate[:flat_usage_rate][:eid],
                uom: usage_rate[:flat_usage_rate][:uom],
                validFrom: usage_rate[:flat_usage_rate][:valid_from],
                validTo: usage_rate[:flat_usage_rate][:valid_to],
                rate: usage_rate[:flat_usage_rate][:rate]
              }.delete_if{|k,v| v.nil?}
            }
          }

          usage_rates
        end
      end

    end

  end

end

