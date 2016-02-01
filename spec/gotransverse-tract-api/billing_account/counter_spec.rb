require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe BillingAccount::Counter do
    before(:each) { http_auth }

    let(:eid) { '4096' }
    let(:response)  { {a: 'b', c: 'd'} }

    context ".update_usage_charge" do
      it "updates a usage event" do
        data = { eid: '4', charge: '77735' }
        allow(subject).to receive(:update_usage_charge).with(eid, data).and_return(response)
        expect(subject.update_usage_charge(eid, data)).to eq(response)
      end
    end

  end
end

