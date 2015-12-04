require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Usage::UsageEvent do
    before(:each) { http_auth }

    context ".create_usage_event" do
      it "creates a usage event" do
        data = {
          :start_time => '20151125T10:10:10',
          :service_resource_id => 'Remax',
          :usage_uom => 'EVENT',
          :usage_amount => '1200.00',
          :number01 => '90'
        }
        response = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'

        allow(subject).to receive(:create_usage_event).with(data).and_return(response)
        expect(subject.create_usage_event(data)).to eq(response)
      end
    end

    context ".void_event" do
      it "voids a single usage event" do
        data = { :eid => '3166788' }
        response = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'

        allow(subject).to receive(:void_event).with(data).and_return(response)
        expect(subject.void_event(data)).to eq(response)
      end
    end
   
  end
end

