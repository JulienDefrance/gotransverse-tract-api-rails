require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Product::Product do
    before(:each) { http_auth }

    context ".find_all" do
      it "returns all products" do
        data = described_class.find_all
        expect(data.count).to be >= 0
      end
    end

    context ".find_by_eid" do
      it "returns a product for the given eid" do
        data = described_class.find_by_eid(0)
        expect(data['eid']).to be_nil 
      end
    end

    context ".find_by_name" do
      it "returns a product for the given name" do
        data = described_class.find_by_name('Postcards 1st Class', 'DEEP')
        expect(data).to_not be_nil 
      end
    end
  end
end

