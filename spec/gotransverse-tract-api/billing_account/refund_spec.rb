require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe BillingAccount::Refund do
    before(:each) { http_auth }

    let(:response)  { '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' }
    let(:eid) { '48406' }

    context ".create_refund" do
      it "creates a refund to the account" do
        data = {
          :amount => '47.00',
          :description => 'Refund Create',
          :original_payment => {
            eid: '123'
          },
          :refund_reason => {
            eid: '456'
          }
        }

        allow(subject).to receive(:create_refund).with(data).and_return(response)
        expect(subject.create_refund(data)).to eq(response)
      end
    end

  end
end
