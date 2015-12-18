require 'spec_helper' 
module GoTransverseTractApi

  RSpec.describe Service::ServiceResource do
    before(:each) { http_auth }

    let(:response)  { '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' }
    let(:eid) { '48406' }
    let(:root_attrs) { 
      {
        :identifier => 'New id',
        :status => 'AVAILABLE',
        :description => 'Test'
      }
    }

    context ".create_service_resource" do
      it "creates a service resource" do
        data = {
          :category => {
            :eid => '324234'
          }
        }
        allow(subject).to receive(:create_service_resource).with(eid, data).and_return(response)
        expect(subject.create_service_resource(eid, data)).to eq(response)
      end
    end

    context ".request" do
      it "requests a service resource" do
        data = {
          :service_resource_category => {
            :eid => '324234'
          }
        }
        #described_class.request(root_attrs.merge data)

        allow(subject).to receive(:request).with(eid, data).and_return(response)
        expect(subject.request(eid, data)).to eq(response)
      end
    end

    context ".change" do
      it "changes a service resource" do
        data = { 
          :change_to_service_resource => root_attrs,
          :category => { :eid => '324234' }
        }

        allow(subject).to receive(:change).with(eid, data).and_return(response)
        expect(subject.change(eid, data)).to eq(response)
      end
    end

    context ".deactivate" do
      it "deactivates a service resource" do
        data = { }

        allow(subject).to receive(:deactivate).with(eid, data).and_return(response)
        expect(subject.deactivate(eid, data)).to eq(response)
      end
    end

    context ".add_service_resource" do
      it "adds a service resource" do
        data = { }

        allow(subject).to receive(:add_service_resource).with(eid, data).and_return(response)
        expect(subject.add_service_resource(eid, data)).to eq(response)
      end
    end

    context ".remove_service_resource" do
      it "removes a service resource" do
        data = { }

        allow(subject).to receive(:remove_service_resource).with(eid, data).and_return(response)
        expect(subject.remove_service_resource(eid, data)).to eq(response)
      end
    end

  end
end