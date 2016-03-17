require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Usage::RateTable do
    before(:each) { http_auth }

    let(:response) { {a: 'b', c: 'd'} }

    describe ".find_all" do
      it "returns all rate table entries" do
        data = described_class.find_all
        expect(data).to_not be_nil
      end
    end

  end

end
