require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Order::OrderItemUsageRule do
    before(:each) { http_auth }

    context ".find_by_eid" do
      it "gets order item usage rules for the given eid" do
        #actual_response = described_class.find_by_eid('81')
      end
    end

    context ".find_by_order_item_eid" do
      it "gets order item usage rules for the given eid" do
        actual_response = described_class.find_by_order_item_eid('274')
        expect(actual_response[:matchAllOrderItemUsageRule][:eid]).to_not be_nil
      end
    end

  end
end


