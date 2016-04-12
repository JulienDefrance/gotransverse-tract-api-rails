require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Usage::RateTableEntry do
    before(:each) { http_auth }

    let(:response) { {a: 'b', c: 'd'} }

    describe ".find_by_eid" do
      it "returns rate table entries for a given rate table eid" do
        data = described_class.find_by_eid(5)
        expect(data).to_not be_nil
      end
    end

  end

end
