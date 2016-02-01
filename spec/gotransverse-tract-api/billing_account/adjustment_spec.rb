require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe BillingAccount::Adjustment do
    before(:each) { http_auth }

    let(:response)  { {a: 'b', c: 'd'} }
    let(:eid) { '48406' }
    let(:data) { { 
          :full_amount => 'true',
          :occurred_on => '2014-10-01T00:00:00',
          :amount => '1.00',
          :description => 'dsfsfsdfsdfsd sdsdsdvss',
          :invoiced => 'false',
          :credit => 'true',
          :status => 'pending',
          :type => 'MANUAL',
          :manual_invoice_application => 'true',
          eid: '124343',
          :billing_account => {
            :account_num => '5635',
            :bill_type => 'EMAIL',
            :automatic_recurring_payment => 'false',
            :status => 'Active',
            :pending_charges_total => '0.00',
            :balance => '-10.00',
            :start_date => '2014-11-11T10:00:00',
            :tax_exempt => 'false',
            eid: '3663',
            :daily_bill_cycle => {
              :name => 'daily 10 to 3',
              :start_date => '2014-11-11T10:00:00',
              :end_date => '2014-11-12T10:00:00',
              :bill_cycle_type => 'Daily',
              :auto_bill => 'true',
              :use_payment_term => 'true',
              :status => 'ACTIVE',
              eid: '223'
            },
            :person => {
              :first_name => 'John',
              :last_name => 'Smith',
              eid: '3305',
              :addresses => {
                :postal_address => {
                  :purpose => 'BILLING',
                  :country => 'USA',
                  :city => 'Dallas',
                  :region_or_state => 'TX',
                  :postal_code => '78665',
                  :line1 => '123 Main St',
                  eid: '3453'
                },
                :email_address => {
                  :purpose => 'PRIMARY',
                  :email => 'john@smith.com',
                  eid: '3453'
                }
              }
            },
            :billing_account_category => {
              :type => 'All',
              :description => 'dsdgdg dhretsdfdg eggdg',
              :status => 'ACTIVE',
              eid: '45354'
            },
            :services => {
              :page_number => '1',
              :page_size => '50',
              :total_elements => '1',
              :element_count => '0',
              :total_pages => '1'
            },
            :payment_term => {
              :name => 'Immediate',
              :term_days => '0',
              :grace_days => '0',
              eid: '353'
            }
          },
          :reason => {
            :name => 'Default Credit Adjustment',
            :description => 'sefwgsvd dhgrgsfree ergreg',
            :status => 'Active',
            :credit_only => 'true',
            eid: '99'
          }
        } }

    context ".post" do
      it "posts the adjustment" do
        data_for_post = { 
          eid: '124343'
        }

        allow(subject).to receive(:post).with(eid, data_for_post).and_return(response)
        expect(subject.post(eid, data_for_post)).to eq(response)
      end
    end

    context ".reverse" do
      it "reverses the adjustment" do
        allow(subject).to receive(:reverse).with(eid, data).and_return(response)
        expect(subject.reverse(eid, data)).to eq(response)
      end
    end

    context ".add_invoice_application" do
      it "adds invoice application to adjustment" do
        data[:invoice_adjustment_application] = {
          :amount => '1.0',
          :invoice => {
            :invoice_num => '23',
            :amount => '10.00',
            :pdf_path => 'https://my.tractbilling.com/t/s/r/1.28/invoices/2914/pdf',
            :occurred_on => '2014-10-10T00:00:00',
            :due_date => '2014-10-10T00:00:00',
            :amount_to_pay => '4.00',
            :late_fee_charged => 'false',
            :status => 'open',
            :usage_csv_path => 'https://my.tractbilling.com/t/s/r/1.28/invoices/2914/csv',
            eid: '2342'
          }
        }

        allow(subject).to receive(:add_invoice_application).with(eid, data).and_return(response)
        expect(subject.add_invoice_application(eid, data)).to eq(response)
      end
    end

    context ".reverse_invoice_application" do
      it "reverses invoice application from adjustment" do

        data[:invoice_adjustment_application] = {
          :reversed => 'false',
          :applied_on => '2014-10-10T10:10:10',
          :amount => '1.0',
          eid: '197',
          :account_adjustment => {
            :invoiced => 'true',
            :credit => 'true',
            :status => 'POSTED',
            :posted_on => '2014-01-01T10:00:00',
            :posted_by => 'Admin'
          },
          :invoice => {
            :invoice_num => '23',
            :amount => '10.00',
            :pdf_path => 'https://my.tractbilling.com/t/s/r/1.28/invoices/2914/pdf',
            :occurred_on => '2014-10-10T00:00:00',
            :due_date => '2014-10-10T00:00:00',
            :amount_to_pay => '4.00',
            :late_fee_charged => 'false',
            :status => 'open',
            :usage_csv_path => 'https://my.tractbilling.com/t/s/r/1.28/invoices/2914/csv',
            eid: '2342'
          }
        }

        allow(subject).to receive(:reverse_invoice_application).with(eid, data).and_return(response)
        expect(subject.reverse_invoice_application(eid, data)).to eq(response)
      end
    end

    context ".create_adjustment" do
      it "creates an adjustment" do
        data = {
          :occurred_on => '2013-11-11T11:00:00',
          :amount => '10.00',
          :description => 'some thing fishy',
          :type => 'MANUAL',
          :credit => 'true',
          :posted => 'false',
          :billing_account => {
            eid: '322'
          },
          :reason => {
            eid: '6456'
          }
        }

        allow(subject).to receive(:create_adjustment).with(data).and_return(response)
        expect(subject.create_adjustment(data)).to eq(response)
      end
    end

  end
end

