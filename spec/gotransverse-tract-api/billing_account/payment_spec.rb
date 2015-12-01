require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe BillingAccount::Payment do
    before(:each) { http_auth }

    context ".find_by_eid" do
      it "returns a payment for the given eid" do
        #data = described_class.find_by_eid(1)
        #expect(data['eid']).to eq('1')
      end
    end

    context ".referrer_token" do
      it "returns a token" do
        error_url = "http://smartzip-error.com"
        cancel_url = "http://smartzip-cancel.com"
        complete_url = "http://smartzip-complete.com"

        actual_response = described_class.referrer_token(error_url,cancel_url,complete_url)
        expect(actual_response['referrer']['referrerToken']).to_not be_nil
      end

    end

  end
end

