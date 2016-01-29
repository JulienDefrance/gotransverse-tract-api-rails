require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Order::BillCycle do
    before(:each) { http_auth }

    let(:eid) { '4086' }

    context ".find_by_eid" do
      it "returns a billing cycle for the given eid" do
        data = described_class.find_by_eid(eid)
        expect(data.count).to be >= 0
      end
    end

    context ".find_all" do
      it "returns all billing cycles" do
        data = described_class.find_all
        expect(data.count).to be >= 0
      end
    end

  end
end
