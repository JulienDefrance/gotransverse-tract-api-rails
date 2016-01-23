module GoTransverseTractApi

  module Order

    class ScheduledCharge

      def self.get_scheduled_charges scheduled_charges
        sch_charges = {
          attributes: api_data.get_page_info(scheduled_charges),
          scheduleCharge: {
            eid: scheduled_charges[:eid],
            description: scheduled_charges[:description],
            amount: scheduled_charges[:amount],
            invoiced: scheduled_charges[:invoiced],
            chargeDate: scheduled_charges[:charge_date]
          }
        }

        sch_charges.delete_if{|k,v| v.nil?}
      end

    end

  end

end
