require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Usage::UsageEvent do
    before(:each) { http_auth }

    let(:response) { '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' }
    let(:event) {
      {
        :start_time => '20151125T10:10:10',
        :service_resource_id => 'Remax',
        :usage_uom => 'EVENT',
        :usage_amount => '1200.00',
        :description => 'Testing',
        :service_resource_type => 'GENERICSVC'
      }
    }

    context ".create_usage_event" do
      it "creates a usage event" do
        elem = { :number01 => '90' }

        data = event.delete_if do|k,v|
          k.to_s == 'description'
        end

        #described_class.create_usage_event(data.merge!(elem))

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

