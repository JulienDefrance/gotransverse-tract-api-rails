module GoTransverseTractApi

  module BillingAccount

    class Refund

      def self.find_all
        GoTransverseTractApi.get_response_for(self)
      end

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self, {eid: eid})
      end

      #
      # @param {Long} payment_eid
      #
      def self.find_by_payment_eid payment_eid
        GoTransverseTractApi.get_response_for(self, {payment_eid: payment_eid})
      end

      #
      # @param {String} account_num
      #
      def self.find_by_account_num account_num
        GoTransverseTractApi.get_response_for(self, {account_num: account_num})
      end

      #
      # @param {Long} billing_account_eid
      #
      def self.find_by_billing_account_eid billing_account_eid
        GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid})
      end

      #
      # @param {DateTime} occured_on
      #
      def self.find_by_occured_on occured_on
        GoTransverseTractApi.get_response_for(self, {occured_on: occured_on})
      end

      #
      # @param {String} reference
      #
      def self.find_by_reference reference
        GoTransverseTractApi.get_response_for(self, {reference: reference})
      end

      #
      # @param {String} status
      #
      def self.find_by_status status
        GoTransverseTractApi.get_response_for(self, {status: status})
      end

      #
      # @param {String} authorization
      #
      def self.find_by_authorization authorization
        GoTransverseTractApi.get_response_for(self, {authorization: authorization})
      end

      #
      # @param {Hash} refund
      #
      def self.create_refund refund
        data = {
          refund: {
            amount: refund[:amount],
            description: refund[:description]
          },
          originalPayment: {
            eid: refund[:original_payment][:eid]
          },
          refundReason: {
            eid: refund[:refund_reason][:eid]
          }
        }

        xml_data = GoTransverseTractApi.generateXML(data, 'refund')
        GoTransverseTractApi.post_request_for(self, {}, xml_data, "")
      end

    end

  end

end
