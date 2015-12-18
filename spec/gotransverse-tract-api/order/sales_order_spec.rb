require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Order::SalesOrder do
    before(:each) { http_auth }

    let(:response) { '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' }

    context ".add_custom_field_value" do
      it "adds custom field value for the sales order" do
        eid = '48406'
        data = { :value => 'yes' }

        allow(subject).to receive(:add_custom_field_value).with(eid, data).and_return(response)
        expect(subject.add_custom_field_value(eid, data)).to eq(response)
      end
    end

    context ".confirm" do
      it "confirms the sales order" do
        eid = '48406'

        data = {
          :sales_order => {
            :referral => 'Order Item',
            :order_date => '2015-07-09',
            :order_status => '0.00',
            :eid => '48406',
            :order_items => {
              :page_number => '1',
              :page_size => '50',
              :total_elements => '0',
              :element_count => '0',
              :total_pages => '0',
              :order_item => {
                :quantity => '1',
                :product => [{
                  :name => 'sdfsdfsvs',
                  :description => 'dsfsgegebdbb',
                  :short_description => 'asfgerdbdb',
                  :product_type_code => 'udygciww',
                  :product_state => 'afwfwss',
                  :requires_agreement => 'true',
                  :serialized => 'false',
                  :taxable => 'false',
                  :trial => 'asda',
                  :default_quantity => '10',
                  :min_service_resources => '0',
                  :max_service_resources => '0',
                  :trial_override => 'false',
                  :eid => '234',
                  :product_prices => {
                    :page_number => '1',
                    :page_size => '50',
                    :total_elements => '1',
                    :element_count => '1',
                    :total_pages => '1',
                    :product_price => {
                      :from_date => '2013-02-10T01:00:00',
                      :price_override => 'true',
                      :type => 'Recurring',
                      :recurring_payment_required => 'false',
                      :eid => '12345',
                      :price_ranges => {
                        :page_number => '1',
                        :page_size => '50',
                        :total_elements => '1',
                        :element_count => '1',
                        :total_pages => '1',
                        :price_range => {
                          :quantity_begin_range => '0.00',
                          :price => '10.00',
                          :level => '1',
                          :eid => '812'
                        }
                      }
                    }
                  },
                  :product_category => {
                    :name => 'sdfsdfs',
                    :description => 'wrggdgd',
                    :status => 'Active',
                    :eid => '234'
                  },
                  :actions => {
                    :page_number => '1',
                    :page_size => '50',
                    :total_elements => '1',
                    :element_count => '1',
                    :total_pages => '1',
                  },
                  :product_usage_rules => {
                    :page_number => '1',
                    :page_size => '50',
                    :total_elements => '1',
                    :element_count => '1',
                    :total_pages => '1'
                  }
                }]
              }
            },
            :billing_account => {
              :automatic_recurring_payment => 'false',
              :eid => '2535'
            }
          },
          :payment => {
            :amount => '100',
            :description => 'sdgegegeg',
            :billing_account => {
              :automatic_recurring_payment => 'false',
              :eid => '2535'
            },
            :credit_card_payment => {
              :card_type => 'visa',
              :card_holder_first_name => 'sgdfvdv',
              :card_holder_middle_name => 'sgdfvdv',
              :card_holder_last_name => 'sgdfvdv',
              :card_identifier_number => '2353643423412354754',
              :card_expiration => "12/20"
            }
          }
        }

        allow(subject).to receive(:confirm).with(eid, data).and_return(response)
        expect(subject.confirm(eid, data)).to eq(response)
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
                :eid => '232353'
              }]
            }
          },
          :billing_account => {
            :bill_type => 'EMAIL',
            :automatic_recurring_payment => 'true',
            :daily_bill_cycle => {
              :eid => '34535'
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
              :eid => '749'
            }
          }
        }

        allow(subject).to receive(:create_sales_order).with(data).and_return(response)
        expect(subject.create_sales_order(data)).to eq(response)
      end
    end

  end
end

