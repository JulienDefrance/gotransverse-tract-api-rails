module GoTransverseTractApi

  module BillingAccount

    class Refund < RecurringPayment

      #
      # @param {Long} payment_eid
      # @param {Hash} options
      #
      def self.find_by_payment_eid payment_eid, options=nil 
        return nil unless payment_eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({payment_eid: payment_eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {DateTime} occurred_on
      # @param {Hash} options
      #
      def self.find_by_occurred_on occurred_on, options=nil
        return nil unless occurred_on.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({occurred_on: occurred_on}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {String} reference
      # @param {Hash} options
      #
      def self.find_by_reference reference, options=nil
        return nil unless reference.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({reference: reference}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {String} status
      # @param {Hash} options
      #
      def self.find_by_status status, options=nil
        return nil unless status.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({status: status}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {String} authorization
      # @param {Hash} options
      #
      def self.find_by_authorization authorization, options=nil
        return nil unless authorization.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({authorization: authorization}, options)
        GoTransverseTractApi.get_response_for(self, params)
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
