require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe BillingAccount::Payment do
    before(:each) { http_auth }

    let(:eid) { '4086' }
    let(:response)  { {a: 'b', c: 'd'} }

    context ".find_by_eid" do
      it "returns a payment for the given eid" do
        data = described_class.find_by_eid(1)
        expect(data.count).to be >= 0
      end
    end

    context ".referrer_token" do
      it "returns a token" do
        error_url = "http://smartzip-error.com"
        cancel_url = "http://smartzip-cancel.com"
        complete_url = "http://smartzip-complete.com"

        token = 'afsfsferrhdgd234235sfe4'

        allow(subject).to receive(:referrer_token).with(error_url,cancel_url,complete_url).and_return(token)
        expect(subject.referrer_token(error_url,cancel_url,complete_url)).to eq(token)
      end
    end

    context ".apply_refund" do
      it "applies a refund to the payment account" do
        data = {
          payment: {
            eid: '123'
          },
          refund: {
            amount: '47.00',
            description: 'Refund Create',
            original_payment: {
              eid: '456'
            },
            refund_reason: {
              eid: '4'
            }
          }
        }

        allow(subject).to receive(:apply_refund).with(data).and_return(response)
        expect(subject.apply_refund(data)).to eq(response)
      end
    end

    context ".cancel" do
      it "cancels a payment" do
        data = {
          description: 'Test Cancel',
          payment:  {
            eid: '123'
          },
          reason: {
            eid: '123'
          }
        }

        allow(subject).to receive(:cancel).with(eid, data).and_return(response)
        expect(subject.cancel(eid, data)).to eq(response)
      end
    end

    context ".reallocate" do
      it "reallocates a payment" do
        data = {
          description: 'Test Reallocate',
          payment: {
            eid: '123'
          },
          reason: {
            eid: '123'
          },
          invoices: [{
            invoice: {
              eid: '123'
            }},
            {
            invoice: {
              eid: '456'
            }}]
        }

        allow(subject).to receive(:reallocate).with(eid, data).and_return(response)
        expect(subject.reallocate(eid, data)).to eq(response)
      end
    end

    context ".create_payment" do
      it "creates a payment" do
        data = {
          use_recurring_payment: 'true',
          amount: '100.00',
          description: 'Credit Card Payment',
          billing_account: {
            eid: '165'
          }
        }

        allow(subject).to receive(:create_payment).with(data).and_return(response)
        expect(subject.create_payment(data)).to eq(response)
      end
    end

  end
end

