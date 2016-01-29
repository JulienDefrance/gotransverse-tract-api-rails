require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Order::SalesOrder do
    before(:each) { http_auth }

    let(:eid) { '296'}
    let(:response) { {a: 'b', c: 'd'} }

    context ".find_by_eid" do
      it "returns a sales order for the given eid" do
        data = described_class.find_by_eid(eid)
        expect(data).to_not be_nil 
      end
    end

    context ".add_custom_field_value" do
      it "adds custom field value for the sales order" do
        data = { :value => 'yes' }

        allow(subject).to receive(:add_custom_field_value).with(eid, data).and_return(response)
        expect(subject.add_custom_field_value(eid, data)).to eq(response)
      end
    end

    context ".confirm" do
      it "confirms the sales order" do
        allow(subject).to receive(:confirm).with(eid).and_return(response)
        expect(subject.confirm(eid)).to eq(response)
      end
    end

    context ".create_sales_order" do
      it "creates a sales order" do

        data = {
          :note => 'Order Item',
          :purchase_order_number => '2015-07-09',
          :order_items => {
            :order_item => {
              :quantity => '1',
              :product => [{
                eid: '232353'
              }]
            }
          },
          :billing_account => {
            :bill_type => 'EMAIL',
            :automatic_recurring_payment => 'true',
            :daily_bill_cycle => {
              eid: '34535'
            },
            :organization => {
              :name => 'eregedvdvd',
              :tax_id_number => '56-4575675',
              :addresses => {
                :postal_address => [{
                  :purpose => 'SERVICE',
                  :country => 'USA',
                  :city => 'Fremont',
                  :region_or_state => 'CA',
                  :postal_code => '94538',
                  :line1 => 'sdgwg wfegfdg',
                  :line2 => 'wefergdvdg ergegdf'
                },
                {
                  :purpose => 'BILLING',
                  :country => 'USA',
                  :city => 'Fremont',
                  :region_or_state => 'CA',
                  :postal_code => '94538',
                  :line1 => 'sdgwg wfegfdg',
                  :line2 => 'wefergdvdg ergegdf'
                },
                {
                  :purpose => 'SHIPPING',
                  :country => 'USA',
                  :city => 'Fremont',
                  :region_or_state => 'CA',
                  :postal_code => '94538',
                  :line1 => 'sdgwg wfegfdg',
                  :line2 => 'wefergdvdg ergegdf'
                }],
                :telecom_address => {
                  :dialing_prefix => '9',
                  :country_code => '1',
                  :area_code => '510',
                  :number => '234325',
                  :extension => '24',
                  :purpose => 'OFFICE'
                },
                :email_address => {
                  :email => 'sjdhfs@sdfgs.com',
                  :purpose => 'PRIMARY'
                }
              }
            },
            :billing_account_category => {
              eid: '749'
            }
          }
        }

        allow(subject).to receive(:create_sales_order).with(data).and_return(response)
        expect(subject.create_sales_order(data)).to eq(response)
      end
    end

    context ".delete_draft_order" do
      it "deletes an existing draft sales order for a given id" do
        allow(subject).to receive(:delete_draft_order).with(eid).and_return(response)
        expect(subject.delete_draft_order(eid)).to eq(response)
      end
    end

  end
end

