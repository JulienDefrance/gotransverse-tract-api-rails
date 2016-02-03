module GoTransverseTractApi

  module BillingAccount

    class Refund

      def self.find_all
        GoTransverseTractApi.get_response_for(self)
      end

      #
      # @param {Long} eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_eid eid, query_scope=nil 
        GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
      end

      #
      # @param {Long} payment_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_payment_eid payment_eid, query_scope=nil 
        GoTransverseTractApi.get_response_for(self, {payment_eid: payment_eid, queryScope: query_scope})
      end

      #
      # @param {String} account_num
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_account_num account_num, query_scope=nil 
        GoTransverseTractApi.get_response_for(self, {account_num: account_num, queryScope: query_scope})
      end

      #
      # @param {Long} billing_account_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_billing_account_eid billing_account_eid, query_scope=nil 
        GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid, queryScope: query_scope})
      end

      #
      # @param {DateTime} occured_on
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_occured_on occured_on, query_scope=nil 
        GoTransverseTractApi.get_response_for(self, {occured_on: occured_on, queryScope: query_scope})
      end

      #
      # @param {String} reference
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_reference reference, query_scope=nil 
        GoTransverseTractApi.get_response_for(self, {reference: reference, queryScope: query_scope})
      end

      #
      # @param {String} status
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_status status, query_scope=nil 
        GoTransverseTractApi.get_response_for(self, {status: status, queryScope: query_scope})
      end

      #
      # @param {String} authorization
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_authorization authorization, query_scope=nil 
        GoTransverseTractApi.get_response_for(self, {authorization: authorization, queryScope: query_scope})
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
