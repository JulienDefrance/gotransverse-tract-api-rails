require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Product::DiscountIdentifier do
    before(:each) { http_auth }

    context ".find_by_eid" do
      it "returns a discount identifier for the given eid" do
      end
    end

    context ".find_all" do
      it "returns all discount identifiers" do
        data = described_class.find_all
        expect(data.count).to be >= 0
      end
    end

  end
end
