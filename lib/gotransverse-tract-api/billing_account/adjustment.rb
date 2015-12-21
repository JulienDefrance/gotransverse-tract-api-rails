module GoTransverseTractApi

  module BillingAccount

    class Adjustment

      class << self

        #
        # @param {Long} eid
        #
        def find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} account_num
        #
        def find_by_account_num account_num
          GoTransverseTractApi.get_response_for(self, {account_num: account_num})
        end

        #
        # @param {Long} billing_account_eid
        #
        def find_by_billing_account_eid billing_account_eid
          GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid})
        end

        #
        # @param {Long} invoice_num
        #
        def find_by_invoice_num invoice_num
          GoTransverseTractApi.get_response_for(self, {invoice_num: invoice_num})
        end

        #
        # @param {Long} invoice_eid
        #
        def find_by_invoice_eid invoice_eid
          GoTransverseTractApi.get_response_for(self, {invoice_eid: invoice_eid})
        end

        #
        # @param {String} status
        #
        def find_by_status status
          GoTransverseTractApi.get_response_for(self, {status: status})
        end

        #
        # @param {Long} eid
        # @param {Hash} adjustment
        #
        def post eid, adjustment
          data = {
            postAdjustment: {},
            adjustment: {
              attributes: {
                eid: adjustment[:eid]
              }
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'postAdjustment')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "post")
        end

        #
        # @param {Long} eid
        # @param {Hash} adjustment
        #
        def reverse eid, adjustment
          data = {
            reverseAdjustment: {
              fullAmount: adjustment[:full_amount]
            },
            adjustment: make_adjustment(adjustment)
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'reverseAdjustment')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "reverse")
        end

        #
        # @param {Long} eid
        # @param {Hash} adjustment
        #
        def add_invoice_application eid, adjustment

          account_adjustment = make_adjustment(adjustment)

          data = {
            addInvoiceApplicationToAdjustment: {},
            adjustment: account_adjustment,
            invoiceAdjustmentApplication: {
              attributes: {
                amount: adjustment[:invoice_adjustment_application][:amount]
              },
              accountAdjustment: account_adjustment,
              invoice: get_invoice(adjustment, account_adjustment)
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'addInvoiceApplicationToAdjustment')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "addInvoiceApplication")
        end

        #
        # @param {Long} eid
        # @param {Hash} adjustment
        #
        def reverse_invoice_application eid, adjustment

          account_adjustment = make_adjustment(adjustment)

          data = {
            reverseInvoiceApplicationFromAdjustment: {},
            adjustment: account_adjustment,
            invoiceAdjustmentApplication: {
              attributes: {
                reversed: adjustment[:invoice_adjustment_application][:reversed],
                appliedOn: adjustment[:invoice_adjustment_application][:applied_on],
                amount: adjustment[:invoice_adjustment_application][:amount],
                eid: adjustment[:invoice_adjustment_application][:eid]
              },
              accountAdjustment: {
                attributes: {
                  occurredOn: adjustment[:occurred_on],
                  amount: adjustment[:amount],
                  description: adjustment[:description],
                  invoiced: adjustment[:invoice_adjustment_application][:account_adjustment][:invoiced],
                  credit: adjustment[:invoice_adjustment_application][:account_adjustment][:credit],
                  status: adjustment[:invoice_adjustment_application][:account_adjustment][:status],
                  type: adjustment[:type],
                  posted_on: adjustment[:invoice_adjustment_application][:account_adjustment][:posted_on],
                  posted_by: adjustment[:invoice_adjustment_application][:account_adjustment][:posted_by],
                  manualInvoiceApplication: adjustment[:manual_invoice_application],
                  eid: adjustment[:eid]
                },
                billingAccount: account_adjustment[:billingAccount],
                reason: account_adjustment[:reason],
                adjustmentApplications: account_adjustment[:billingAccount][:services]
              },
              invoice: get_invoice(adjustment, account_adjustment)
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'reverseInvoiceApplicationFromAdjustment')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "reverseInvoiceApplication")
        end

        #
        # @param {Hash} adjustment
        #
        def create_adjustment adjustment

          data = {
            adjustment: {
              occurredOn: adjustment[:occurred_on],
              amount: adjustment[:amount],
              description: adjustment[:description],
              type: adjustment[:type],
              credit: adjustment[:credit],
              posted: adjustment[:posted]
            },
            billingAccount: {
              eid: adjustment[:billing_account][:eid]
            },
            reason: {
              eid: adjustment[:reason][:eid]
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'adjustment')
          GoTransverseTractApi.post_request_for(self, {}, xml_data, "")
        end

        private

        def get_invoice (adjustment, account_adjustment)
          {
            attributes: {
              invoiceNum: adjustment[:invoice_adjustment_application][:invoice][:invoice_num],
              amount: adjustment[:invoice_adjustment_application][:invoice][:amount],
              pdfPath: adjustment[:invoice_adjustment_application][:invoice][:pdf_path],
              occurredOn: adjustment[:invoice_adjustment_application][:invoice][:occurred_on],
              dueDate: adjustment[:invoice_adjustment_application][:invoice][:due_date],
              amountToPay: adjustment[:invoice_adjustment_application][:invoice][:amount_to_pay],
              lateFeeCharged: adjustment[:invoice_adjustment_application][:invoice][:late_fee_charged],
              status: adjustment[:invoice_adjustment_application][:invoice][:status],
              usageCsvPath: adjustment[:invoice_adjustment_application][:invoice][:usage_csv_path],
              eid: adjustment[:invoice_adjustment_application][:invoice][:eid]
            },
            billingAccount: account_adjustment[:billingAccount],
            billCycle: account_adjustment[:billingAccount][:dailyBillCycle],
            invoiceItems: account_adjustment[:billingAccount][:services]
          }
        end

        def make_adjustment adjustment
          adjustment = {
            attributes: {
              occurredOn: adjustment[:occurred_on],
              amount: adjustment[:amount],
              description: adjustment[:description],
              invoiced: adjustment[:invoiced],
              credit: adjustment[:credit],
              status: adjustment[:status],
              type: adjustment[:type],
              manualInvoiceApplication: adjustment[:manual_invoice_application],
              eid: adjustment[:eid]
            },
            billingAccount: {
              attributes: {
                accountNum: adjustment[:billing_account][:account_num],
                billType: adjustment[:billing_account][:bill_type],
                automaticRecurringPayment: adjustment[:billing_account][:automatic_recurring_payment],
                status: adjustment[:billing_account][:status],
                pendingChargesTotal: adjustment[:billing_account][:pending_charges_total],
                balance: adjustment[:billing_account][:balance],
                startDate: adjustment[:billing_account][:start_date],
                taxExempt: adjustment[:billing_account][:tax_exempt],
                eid: adjustment[:billing_account][:eid]
              },
              dailyBillCycle: {
                name: adjustment[:billing_account][:daily_bill_cycle][:name],
                startDate: adjustment[:billing_account][:daily_bill_cycle][:start_date],
                endDate: adjustment[:billing_account][:daily_bill_cycle][:end_date],
                billCycleType: adjustment[:billing_account][:daily_bill_cycle][:bill_cycle_type],
                autoBill: adjustment[:billing_account][:daily_bill_cycle][:auto_bill],
                usePaymentTerm: adjustment[:billing_account][:daily_bill_cycle][:use_payment_term],
                status: adjustment[:billing_account][:daily_bill_cycle][:status],
                eid: adjustment[:billing_account][:daily_bill_cycle][:eid]
              },
              person: {
                attributes: {
                  firstName: adjustment[:billing_account][:person][:first_name],
                  lastName: adjustment[:billing_account][:person][:last_name],
                  eid: adjustment[:billing_account][:person][:eid]
                },
                addresses: {
                  attributes: {},
                  postalAddress: {
                    purpose: adjustment[:billing_account][:person][:addresses][:postal_address][:purpose],
                    country: adjustment[:billing_account][:person][:addresses][:postal_address][:country],
                    city: adjustment[:billing_account][:person][:addresses][:postal_address][:city],
                    regionOrState: adjustment[:billing_account][:person][:addresses][:postal_address][:region_or_state],
                    postalCode: adjustment[:billing_account][:person][:addresses][:postal_address][:postal_code],
                    line1: adjustment[:billing_account][:person][:addresses][:postal_address][:line1],
                    eid: adjustment[:billing_account][:person][:addresses][:postal_address][:eid]
                  },
                  emailAddress: {
                    purpose: adjustment[:billing_account][:person][:addresses][:email_address][:purpose],
                    email: adjustment[:billing_account][:person][:addresses][:email_address][:email],
                    eid: adjustment[:billing_account][:person][:addresses][:email_address][:eid]
                  }
                }
              },
              billingAccountCategory: {
                type: adjustment[:billing_account][:billing_account_category][:type],
                description: adjustment[:billing_account][:billing_account_category][:description],
                status: adjustment[:billing_account][:billing_account_category][:status],
                eid: adjustment[:billing_account][:billing_account_category][:eid]
              },
              services: {
                pageNumber: adjustment[:billing_account][:services][:page_number],
                pageSize: adjustment[:billing_account][:services][:page_size],
                totalElements: adjustment[:billing_account][:services][:total_elements],
                elementCount: adjustment[:billing_account][:services][:element_count],
                totalPages: adjustment[:billing_account][:services][:total_pages]
              },
              paymentTerm: {
                name: adjustment[:billing_account][:payment_term][:name],
                termDays: adjustment[:billing_account][:payment_term][:term_days],
                graceDays: adjustment[:billing_account][:payment_term][:grace_days],
                eid: adjustment[:billing_account][:payment_term][:eid]
              }
            },
            reason: {
              name: adjustment[:reason][:name],
              description: adjustment[:reason][:description],
              status: adjustment[:reason][:status],
              creditOnly: adjustment[:reason][:credit_only],
              eid: adjustment[:reason][:eid]
            }
          }
        end

      end

    end

  end

end
