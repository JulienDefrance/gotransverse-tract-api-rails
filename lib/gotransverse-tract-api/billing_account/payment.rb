module GoTransverseTractApi

  module BillingAccount

    class Payment

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self, {eid: eid})
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
      def find_by_billing_account_eid billing_account_eid
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
      def find_by_reference reference
        GoTransverseTractApi.get_response_for(self, {reference: reference})
      end

      #
      # @param {String} status
      #
      def find_by_status status
        GoTransverseTractApi.get_response_for(self, {status: status})
      end

      #
      # @param {String} authorization
      #
      def find_by_authorization authorization
        GoTransverseTractApi.get_response_for(self, {authorization: authorization})
      end

      #
      # @param {String} error_url
      # @param {String} cancel_url
      # @param {String} complete_url
      #
      def self.get_referrer_token_for error_url, cancel_url, complete_url
        GoTransverseTractApi.post_request_for(self, {error_url: error_url, cancel_url: cancel_url, complete_url: complete_url}, {}, "referrerToken")
      end

    end

  end

end