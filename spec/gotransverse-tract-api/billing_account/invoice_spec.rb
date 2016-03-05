require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe BillingAccount::Invoice do
    before(:each) { http_auth }

    let(:eid) { '48406' }
    let(:response)  { {a: 'b', c: 'd'} }

    describe ".find_by_account_num" do
      it "returns an invoice details for a given account number" do
        account_num = 100

        actual_response = described_class.find_by_account_num(account_num)
        expect(actual_response).to_not be_nil
      end

      it "returns an invoice details for a given account number and options" do
        account_num = 100
        options = {pageSize: 10, pageNumber: 2}

        actual_response = described_class.find_by_account_num(account_num, options)
        expect(actual_response).to_not be_nil
      end
    end

    describe ".find_by_where_invoice" do
      it "returns an invoice details for the given dates" do
        where_invoice = "(occurredOn gte '2016-01-15' and occurredOn lte '2016-03-10')"

        actual_response = described_class.find_by_where_invoice(where_invoice)
        expect(actual_response).to_not be_nil
      end
    end

    describe ".apply_payment" do
      it "applies a payment to the invoice" do
        data = {
          billing_account: {
            eid: '123'
          },
          invoice: {
            eid: '456'
          },
          payment: {
            amount: '27',
            use_recurring_payment: 'false',
            credit_card_payment: {
              card_type: 'VISA',
              card_holder_first_name: 'Mary',
              card_holder_last_name: 'Smith',
              card_identifier_number: '4111111111111111111',
              card_verification_number: '123',
              card_expiration: '12/2016'
            },
            billing_account: {
              eid: '123'
            }
          }
        }

        allow(subject).to receive(:apply_payment).with(eid, data).and_return(response)
        expect(subject.apply_payment(eid, data)).to eq(response)
      end
    end

  end
end
