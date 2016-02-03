require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Order::OrderItem do
    before(:each) { http_auth }

    let(:response)  { {a: 'b', c: 'd'} }

    context ".approve" do
      it "approves an order item" do
        eid = '48406'

        data = {
          :approval_date => '2015-09-09',
          :type => 'Order Item',
          :awaiting_approval => 'true',
          :requested_effective_date => '2015-07-09',
          :unit_price => '0.00',
          :recurring_unit_price => '10.00',
          :quantity => '1',
          :sequence => '1',
          :date_approval => '2015-09-09',
          :description => 'sjkadfkak',
          eid: '48406',
          :order_items => {
            :page_number => '1',
            :page_size => '50',
            :total_elements => '0',
            :element_count => '0',
            :total_pages => '0'
            },
            :order_item_usage_rules => {
              :page_number => '1',
              :page_size => '50',
              :total_elements => '0',
              :element_count => '0',
              :total_pages => '0'
            },
            :recurring_product_price => {
              :from_date => '2013-02-10T01:00:00',
              :price_override => 'true',
              :type => 'Recurring',
              :payment_on_purchase_required => 'false',
              :recurring_payment_required => 'false',
              :recurrence_period => 'BILLCYCLE',
              eid: '12345',
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
                  eid: '812'
                }
              }
            },
            :product => {
              :name => 'uvaciahcahoqho',
              :description => 'asccaihq gqidiqbckasciahci-cuaca',
              :short_description =>'sdvsucihc',
              :product_type_code => 'SUBSCRIPTION',
              :product_state => 'aihaa',
              :requires_agreement => 'true',
              :serialized => 'false',
              :taxable => 'false',
              :trial => 'asda',
              :default_quantity => '10',
              :internal_name => 'ddsfs',
              :min_service_resources => '0',
              :max_service_resources => '0',
              :trial_override => 'false',
              eid: '234',
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
                  :payment_on_purchase_required => 'false',
                  :recurring_payment_required => 'false',
                  :recurrence_period => 'BILLCYCLE',
                  eid: '12345',
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
                      eid: '812'
                    }
                  }
                }
              },
              :product_category => {
                :name => 'sdfsdfs',
                :description => 'wrggdgd',
                :status => 'Active',
                eid: '234'
              },
              :service_resource_category => {
                :name => 'sdgw', 
                :type => 'A',
                :status => 'sdfsa',
                eid: '345'
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
            },
            :price_list => {
              :name => 'sds',
              eid: '564'
            },
            :service_resources => {
              :page_number => '1',
              :page_size => '50',
              :total_elements => '1',
              :element_count => '1',
              :total_pages => '1'
            },
            :operation_attributes => {
              :page_number => '1',
              :page_size => '50',
              :total_elements => '1',
              :element_count => '1',
              :total_pages => '1'
            },
            :scheduled_charges => {
              :page_number => '1',
              :page_size => '50',
              :total_elements => '1',
              :element_count => '1',
              :total_pages => '1'
            }
          }

        allow(subject).to receive(:approve).with(eid, data).and_return(response)
        expect(subject.approve(eid, data)).to eq(response)
      end
    end

  end
end
