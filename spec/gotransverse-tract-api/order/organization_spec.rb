require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Order::Organization do
    before(:each) { http_auth }

    let(:response)  { {a: 'b', c: 'd'} }

    context ".add_address" do
      it "adds address for the customer" do
        eid = '48406'

        data = {
          person: {eid: eid},
          postal_address: {
            city: 'fsfsfs',
            country: 'USA',
            line1: 'wefsvgg ggdgdgd',
            postal_code: '232433',
            purpose: 'Billing',
            region_or_state: 'CA'
          },
          email_address: {
            email: 'test@test.com'
          },
          telecom_address: {
            country_code: '001',
            area_code: '925',
            number: '123-3214'
          }
        }

        allow(subject).to receive(:add_address).with(eid, data).and_return(response)
        expect(subject.add_address(eid, data)).to eq(response)
      end
    end

  end
end

