require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Product::ProductPrice do
    before(:each) { http_auth }

    context ".find_by_eid" do
      it "returns a product price for a given eid" do
        data = described_class.find_by_eid(82)
        expect(data).to_not be_nil
      end
    end

    context ".find_by_product_eid" do
      it "returns a product price for a given product eid" do
        data = described_class.find_by_product_eid(51)
        expect(data).to_not be_nil
      end
    end
  end
end

