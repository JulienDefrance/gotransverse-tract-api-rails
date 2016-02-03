require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Usage::ProductUsageRule do
    before(:each) { http_auth }

    context ".find_by_product_price_eid" do
      it "returns product usage rules for a given product price eid" do
        data = described_class.find_by_product_price_eid(174)
        expect(data.count).to be >= 0
      end
    end

  end
end
