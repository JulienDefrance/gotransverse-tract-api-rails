require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Usage::UsageEvent do
    before(:each) { http_auth }

    let(:response) { {a: 'b', c: 'd'} }
    let(:event) {
      {
        :start_time => '2015-11-25T10:10:10',
        :service_resource_id => 'quote6',
        :usage_uom => 'COUNT',
        :usage_amount => '1200.00',
        :description => 'Testing',
        :service_resource_type => 'GENERICSRVCRESOURCE'
      }
    }

    context ".simulate" do
      it "simulates a usage event" do
        elem = { number01: '100', text01: 'PC_FC' }

        data = event.merge!(elem)

        allow(subject).to receive(:simulate).with(data).and_return(response)
        expect(subject.simulate(data)).to eq(response)
      end
    end

    context ".create_usage_event" do
      it "creates a usage event" do
        elem = { number01: '90', text01: 'PC_FC' }
        data = event.merge!(elem)

        allow(subject).to receive(:create_usage_event).with(data).and_return(response)
        expect(subject.create_usage_event(data)).to eq(response)
      end
    end

    context ".void_event" do
      it "voids a single usage event" do
        data = { eid: '3166788' }

        allow(subject).to receive(:void_event).with(data).and_return(response)
        expect(subject.void_event(data)).to eq(response)
      end
    end
   
    context ".bulk" do
      it "creates multiple usage events in bulk" do
        events = []

        (0..2).each{ |i| events[i] = event }

        allow(subject).to receive(:bulk).with(events).and_return(response)
        expect(subject.bulk(events)).to eq(response)
      end
    end

  end
end

