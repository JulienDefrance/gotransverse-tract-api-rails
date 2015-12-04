require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Order::Organization do
    before(:each) { http_auth }

    context ".add_address" do
      it "adds address for the customer" do
        eid = '48406'

        data = {
          :city => 'fsfsfs',
          :country => 'USA',
          :line1 => 'wefsvgg ggdgdgd',
          :postal_code => '232433',
          :purpose => 'Billing',
          :region_or_state => 'CA'
        }

        response = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'

        #described_class.add_address(eid, data)

        allow(subject).to receive(:add_address).with(eid, data).and_return(response)
        expect(subject.add_address(eid, data)).to eq(response)
      end
    end

  end
end

