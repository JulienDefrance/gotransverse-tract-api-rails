require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe BillingAccount::Invoice do
    before(:each) { http_auth }

    let(:eid) { '48406' }
    let(:response)  { {a: 'b', c: 'd'} }

    context ".apply_payment" do
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
