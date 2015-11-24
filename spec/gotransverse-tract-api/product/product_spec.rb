require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Product::Product do
    before(:each) { http_auth }

    context ".find_all" do
      it "returns all products" do
        response = described_class.find_all
        num_of_products = response.css('products').children.count
        expect(num_of_products).to be > 1
      end
    end

    context ".find_by_eid" do
      it "returns a product for the given eid" do
        response = described_class.find_by_eid(50)
        data = Hash.from_xml(response.to_s)
        expect(data['products']['product']['eid']).to eq('50')
      end
    end
  end
end

