require 'spec_helper'
module GoTransverseTractApi

  RSpec.describe BillingAccount::RecurringPayment do
    before(:each) { http_auth }

    context ".find_by_account_num" do
      it "returns account details for a given account number" do
        actual_response = described_class.find_by_account_num(8)
        expect(actual_response).to_not be_nil
      end
    end

  end
end

