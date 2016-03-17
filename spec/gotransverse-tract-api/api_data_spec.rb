require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe ApiData do
    before(:each) { http_auth }

    describe ".compact" do
      it "returns a hash by eliminating all nil" do
        given_hash = {a: {}, c: 'p', s: nil, d: {e: nil, m: nil}, f: {g: {}, x: {n: 'h', i: nil, j: 'l'}}}
        expected_hash = {:a=>{}, :c=>"p", :f=>{:g=>{}, :x=>{:n=>"h", :j=>"l"}}}

        expect(described_class.new.compact(given_hash)).to eq(expected_hash)
      end
    end

  end

end
