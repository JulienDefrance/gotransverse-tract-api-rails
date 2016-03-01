module GoTransverseTractApi

  module BillingAccount

    class Payment

      #
      # @param {Long} eid
      # @param {Hash} options
      #
      def self.find_by_eid eid, options=nil
        return nil unless eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} account_num
      # @param {Hash} options
      #
      def self.find_by_account_num account_num, options=nil
        return nil unless account_num.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({account_num: account_num}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} billing_account_eid
      # @param {Hash} options
      #
      def self.find_by_billing_account_eid billing_account_eid, options=nil
        return nil unless billing_account_eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({billing_account_eid: billing_account_eid}, options)
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
      # @param {String} error_url
      # @param {String} cancel_url
      # @param {String} complete_url
      #
      def self.referrer_token error_url, cancel_url, complete_url
        data = {
          generatePaymentCollectionReferrerToken: {},
          errorUrl: error_url,
          completeUrl: complete_url,
          cancelUrl: cancel_url
        }
        xml_data = GoTransverseTractApi.generateXML(data, 'generatePaymentCollectionReferrerToken' )

        GoTransverseTractApi.post_request_for(self, xml_data, "referrerToken")[:referrer][:referrerToken]
      end

      #
      # @param {Long} eid
      # @param {Hash} payment
      #
      def self.apply_refund eid, payment
        data = {
          applyRefund: {},
          payment: {
            eid: payment[:payment][:eid]
          },
          refund: {
            attributes: {
              amount: payment[:refund][:amount],
              description: payment[:refund][:description]
            },
            originalPayment: {
              eid: payment[:refund][:original_payment][:eid]
            },
            refundReason: {
              eid: payment[:refund][:refund_reason][:eid]
            }
          }
        }

        xml_data = GoTransverseTractApi.generateXML(data, 'applyRefund')
        GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "applyRefund")
      end

      #
      # @param {Long} eid
      # @param {Hash} payment
      #
      def self.cancel eid, payment
        data = {
          cancelPayment: {
            description: payment[:description]
          },
          payment: {
            eid: payment[:payment][:eid]
          },
          reason: {
            eid: payment[:reason][:eid]
          }
        }

        GoTransverseTractApi.generateXML(data, 'cancelPayment')
        GoTransverseTractApi.post_request_for(self, {eid: eid}, payment, "cancel")
      end

      #
      # @param {Long} eid
      # @param {Hash} payment
      #
      def self.reallocate eid, payment
        data = {
          reallocatePayment: {
            description: payment[:description]
          },
          payment: {
            eid: payment[:payment][:eid]
          },
          reason: {
            eid: payment[:reason][:eid]
          },
          invoices: {
            attributes: {},
            invoice: payment[:invoices]
          }
        }

        GoTransverseTractApi.generateXML(data, 'reallocatePayment')
        GoTransverseTractApi.post_request_for(self, {eid: eid}, payment, "reallocate")
      end

      #
      # @param {Hash} payment
      #
      def self.create_payment payment
        data = {
          payment: {
            useRecurringPayment: payment[:use_recurring_payment],
            amount: payment[:amount],
            description: payment[:description]
          },
          billingAccount: {
            eid: payment[:billing_account].try(:[],:eid)
          },
          creditCardPayment: {
            cardType: payment[:credit_card_payment].try(:[],:card_type),
            cardHolderFirstName: payment[:credit_card_payment].try(:[],:card_holder_first_name),
            cardHolderLastName: payment[:credit_card_payment].try(:[],:card_holder_last_name),
            cardIdentifierNumber: payment[:credit_card_payment].try(:[],:card_identifier_number),
            cardExpiration: payment[:credit_card_payment].try(:[],:card_expiration)
          }.delete_if{|k,v| v.nil?},
          phoneNumber: {
            countryCode: payment[:phone_number].try(:[],:country_code),
            areaCode: payment[:phone_number].try(:[],:area_code),
            number: payment[:phone_number].try(:[],:number),
            extension: payment[:phone_number].try(:[],:extension),
            purpose: payment[:phone_number].try(:[],:purpose)
          }.delete_if{|k,v| v.nil?},
          emailAddress: {
            email: payment[:email_address].try(:[],:email),
            purpose: payment[:email_address].try(:[],:purpose)
          }.delete_if{|k,v| v.nil?}
        }.delete_if{|k,v| v.empty?}

        xml_data = GoTransverseTractApi.generateXML(data, 'payment')
        GoTransverseTractApi.post_request_for(self, {}, xml_data, "")
      end

    end

  end

end
