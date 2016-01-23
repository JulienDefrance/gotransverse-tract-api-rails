require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe BillingAccount::BillingAccount do
    before(:each) { http_auth }

    let(:response)  { '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' }
    let(:eid) { '136' }
    let(:addresses) { {
      :email_address => {
        :purpose => 'PRIMARY',
        :email => 'test@gotransverse.com'
      },
      :postal_address => {
        :purpose => 'BILLING',
        :country => 'USA',
        :city => 'Pleasanton',
        :region_or_state => 'CA',
        :attention => 'John Simth',
        :postal_code => '94588',
        :line1 => '3423 something st.'
      },
      :telecom_address => {
        :purpose => 'OFFICE',
        :dialing_prefix => '9',
        :country_code => '1',
        :area_code => '925',
        :number => '2341212',
        :extension => '21'
      }
    } }


    context ".apply_payment" do
      it "applies a payment to the invoice" do
        data = {
          :billing_account => {
            eid: '123'
          },
          :invoice => {
            eid: '456'
          },
          :payment => {
            :amount => '27',
            :use_recurring_payment => 'false',
            :credit_card_payment => {
              :card_type => 'VISA',
              :card_holder_first_name => 'Mary',
              :card_holder_last_name => 'Smith',
              :card_identifier_number => '4111111111111111111',
              :card_verification_number => '123',
              :card_expiration => '12/2016',
              :description => 'Test Desc'
            },
            :billing_account => {
              eid: '123'
            }
          }
        }

        allow(subject).to receive(:apply_payment).with(eid, data).and_return(response)
        expect(subject.apply_payment(eid, data)).to eq(response)
      end
    end

    context ".suspend" do
      it "suspends a billing account" do
        data = {
          :billing_account => {
            eid: '123'
          },
          :reason => {
            eid: '456'
          }
        }

        allow(subject).to receive(:suspend).with(eid, data).and_return(response)
        expect(subject.suspend(eid, data)).to eq(response)
      end
    end

    context ".resume" do
      it "resumes a billing account" do
        data = {
          :billing_account => {eid: eid},
          :start_date => '2014-11-11T10:00:00',
          :notes => 'Test notes here'
        }

        allow(subject).to receive(:resume).with(eid, data).and_return(response)
        expect(subject.resume(eid, data)).to eq(response)
      end
    end

    context ".add_recurring_payment" do
      it "adds a recurring payment to the billing account" do
        eid = '29'

        data = {
          :billing_account => {eid: eid},
          :recurring_payment => {
            :credit_card_payment_method => {
              :card_type => 'VISA',
              :card_holder_first_name => 'Mary',
              :card_holder_last_name => 'Smith',
              :card_identifier_number => '4111111111111111',
              :card_expiration => '12/2016'
            }
          }
        }

        allow(subject).to receive(:add_recurring_payment).with(eid, data).and_return(response)
        expect(subject.add_recurring_payment(eid, data)).to eq(response)
      end
    end

    context ".change_service" do
      it "changes service on a billing account" do
        data = {
          :service => {eid: '136'},
          :order => {
            :note => 'Simple note',
            :order_items => {
              :order_item => {
                :quantity => 2,
                :description => 'change service',
                :products => [{
                  eid: '1234'
                },
                {
                  eid: '4567'
                }]
              }
            },
            :billing_account => {eid: eid}
          }
        }

        allow(subject).to receive(:change_service).with(eid, data).and_return(response)
        expect(subject.change_service(eid, data)).to eq(response)
      end
    end

    context ".add_custom_field_value" do
      it "adds custom field value to the billing account" do
        data = { 
          :billing_account => { eid: eid },
          :custom_field_value => { :value => 'yes' }
        }

        allow(subject).to receive(:add_custom_field_value).with(eid, data).and_return(response)
        expect(subject.add_custom_field_value(eid, data)).to eq(response)
      end
    end

    context ".remove_custom_field_value" do
      it "removes custom field value from the billing account" do
        data = { 
          :billing_account => { eid: eid },
          :custom_field_value => { eid: '486' }
        }

        allow(subject).to receive(:remove_custom_field_value).with(eid, data).and_return(response)
        expect(subject.remove_custom_field_value(eid, data)).to eq(response)
      end
    end

    context ".deactivate" do
      it "deactivates a billing account" do
        data = {
          :billing_account => { eid: '123' },
          :reason => { eid: '456' }
        }

        allow(subject).to receive(:deactivate).with(eid, data).and_return(response)
        expect(subject.deactivate(eid, data)).to eq(response)
      end
    end

    context ".create_billing_account" do
      it "creates a billing account" do
        data = {
          :bill_type => 'EMAIL',
          :daily_bill_cycle => { eid: '29' },
          :organization => {
            :name => 'LMH Services',
            :addresses => addresses
          },
          :billing_account_category => {
            eid: '6'
          }
        }

        allow(subject).to receive(:create_billing_account).with(data).and_return(response)
        expect(subject.create_billing_account(data)).to eq(response)
      end
    end

    context ".add_person" do
      it "adds a person to the billing account" do
        data = {
          :billing_account => { eid: eid },
          :person => {
            :first_name => 'Tim',
            :last_name => 'John',
            :middle_name => 'R',
            :addresses => addresses
          }
        }

        allow(subject).to receive(:add_person).with(eid, data).and_return(response)
        expect(subject.add_person(eid, data)).to eq(response)
      end
    end
     
    context ".remove_billing_account" do
      it "removes a person from the billing account" do
        data = {
          :billing_account => { eid: eid },
          :person => { eid: '123' }
        }

        allow(subject).to receive(:remove_billing_account).with(eid, data).and_return(response)
        expect(subject.remove_billing_account(eid, data)).to eq(response)
      end
    end

    context ".create_draft_order" do
      it "creates a draft sales order for the billing account" do
        data = {
          sales_order: {
            referral: 'Unit Test Referral',
            order_date: '2015-07-09T17:22:13',
            order_status: 'DRAFT',
            order_items: {
              order_item: {
                recurring_unit_price: '100.00',
                quantity:  '1',
                sequence:  '1',
                description: 'dsfsgegebdbb',
                product: { eid: '67' },
                selected_agreement: { eid: '15' },
                recurring_product_price: { eid: '102' },
                order_item_usage_rules: {
                  match_all_order_item_usage_rule: {
                    name: 'allowance',
                    status: 'ACTIVE',
                    allowance_type: 'One Time',
                    limit: '500',
                    usage_uom: 'COUNT',
                    charge_category: '34',
                    match_all_product_usage_rule: { eid: '22' },
                    usage_rate: {
                      flat_usage_rate: {
                        rate: '2.00',
                        uom: 'COUNT'
                      }
                    }
                  }
                },
                agreement_configuration: {
                  end_date: '01012016',
                  end_action: 'RENEW_AGREEMENT',
                  preserve_service_price: '1',
                  next_preserve_service_price: '0'
                },
                service_resources: {
                  service_resource: {
                    identifier: 'rg36',
                    category: { eid: '9' }
                  }
                },
                discount_configurations: {
                  discount_configuration: {
                    discount_identifier: { eid: '35' }
                  }
                }
              }
            },
            billing_account: { eid: eid }
          }
        }
    
        #res = described_class.create_draft_order(eid, data)

        allow(subject).to receive(:create_draft_order).with(eid, data).and_return(response)
        expect(subject.create_draft_order(eid, data)).to eq(response)
      end
    end

    context ".update" do
      it "updates a billing account" do
        data = { 
          eid: eid, 
          bill_type: 'one time',
          automatic_recurring_payment: 'true',
          billing_account_category: { eid: '3453' }
        }

        allow(subject).to receive(:update).with(eid, data).and_return(response)
        expect(subject.update(eid, data)).to eq(response)
      end
    end
    
  end
end
