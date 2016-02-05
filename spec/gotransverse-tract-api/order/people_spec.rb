require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Order::People do
    before(:each) { http_auth }

    let(:eid) { '4096' }
    let(:response)  { {a: 'b', c: 'd'} }

    context ".add_address" do
      it "adds address for the customer" do
        eid = '48406'

        data = {
          city: 'fsfsfs',
          country: 'USA',
          line1: 'wefsvgg ggdgdgd',
          postal_code: '232433',
          purpose: 'Billing',
          region_or_state: 'CA'
        }

        allow(subject).to receive(:add_address).with(eid, data).and_return(response)
        expect(subject.add_address(eid, data)).to eq(response)
      end
    end

    context ".update" do
      it "updates a person details" do
        data = { eid: eid, name: 'John Smith', tax_id_number: '124224242' }

        allow(subject).to receive(:update).with(eid, data).and_return(response)
        expect(subject.update(eid, data)).to eq(response)
      end
    end

  end
end

