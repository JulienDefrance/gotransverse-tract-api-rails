require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Order::PaymentTerm do
    before(:each) { http_auth }

    context ".find_all" do
      it "returns all payment terms" do
        data = described_class.find_all
        expect(data).to_not be_nil
      end
    end

  end
end
