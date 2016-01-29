require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Order::Agreement do
    before(:each) { http_auth }

    context ".find_all" do
      it "returns all agreements" do
        data = described_class.find_all
        expect(data.count).to be >= 0
      end
    end

  end
end
