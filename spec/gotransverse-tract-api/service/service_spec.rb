require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe Service::Service do
    before(:each) { http_auth }

    let(:response)  { '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>' }
    let(:eid) { '48406' }
 
    context ".renew" do
      it "renews a service" do

        data = {
          eid: eid,
          :billing_account => {
            eid: '324234'
          },
          :order => {
            :order_items => {
              :order_item => {
                :quantity => '1',
                :sequence => '1',
                :product => {
                  eid: '3453'
                },
                :selected_agreement => {
                  eid: '349'
                }
              }
            },
            :billing_account => {
              eid: '324234'
            },
            :payments => {
              :payment => {
                :amount => '10.00',
                :description => 'Testing',
                :billing_account => {
                  eid: '324234'
                },
                :credit_card_payment => {
                  :card_type => 'VISA',
                  :card_holder_first_name => 'Mary',
                  :card_holder_middle_name => 'M',
                  :card_holder_last_name => 'Smith',
                  :card_identifier_number => '4111111111111111111',
                  :card_expiration => '12/2016'
                }
              },
            }
          }
        }

        allow(subject).to receive(:renew).with(eid, data).and_return(response)
        expect(subject.renew(eid, data)).to eq(response)
      end
    end

    context ".add_discount_identifier" do
      it "adds a discount identifier" do

        data = {
          :amount => '10.00',
          :start_date => '2015-01-01T10:10:10',
          :status => 'ACTIVE',
          :description => 'Testing',
          :renewal_count => '0',
          eid: eid,
          :query_scope => 'SHALLOW',
          :billing_account => {
            eid: '324234',
            :query_scope => 'EID',
          },
          :service_resources => {
            :page_number => '1',
            :page_size => '50',
            :total_elements => '3',
            :element_count => '0',
            :total_pages => '0'
          },
          :product => {
            eid: '608',
            :query_scope => 'EID'
          },
          :service_periods => {
            :page_number => '1',
            :page_size => '50',
            :total_elements => '3',
            :element_count => '0',
            :total_pages => '1'
          },
          :service_prices => {
            :page_number => '1',
            :page_size => '50',
            :total_elements => '1',
            :element_count => '0',
            :total_pages => '1'
          },
          :service_usage_rules => {
            :page_number => '1',
            :page_size => '50',
            :total_elements => '0',
            :element_count => '0',
            :total_pages => '0'
          },
          :counters => {
            :page_number => '1',
            :page_size => '50',
            :total_elements => '1',
            :element_count => '0',
            :total_pages => '1'
          },
          :custom_field_values => {
            :page_number => '1',
            :page_size => '50',
            :total_elements => '1',
            :element_count => '0',
            :total_pages => '1'
          },
          :discount_identifier => {
            :status => 'ACTIVE',
            :unlimited => 'true',
            :uses => '12',
            :identifier => 'dfsf',
            eid: '23453',
            :query_scope => 'DDGHJ',
            :category => {
              eid: '97',
              :query_scope => 'EID'
            }
          }
        } 

        allow(subject).to receive(:add_discount_identifier).with(eid, data).and_return(response)
        expect(subject.add_discount_identifier(eid, data)).to eq(response)
      end
    end

    context ".add_agreement" do
      it "adds an agreement to the service" do
        data = {
          :service => {eid: eid},
          :agreement_service => {
            :end_action => 'RENEW_SERVICE',
            :end_date => '2015-11-11T11:00:00',
            :start_date => '2015-01-11T11:00:00',
            :agreement => {eid: '123'}
          }
        }

        allow(subject).to receive(:add_agreement).with(eid, data).and_return(response)
        expect(subject.add_agreement(eid, data)).to eq(response)
      end
    end
    
    context ".resume" do
      it "resumes the service" do
        data = { }

        allow(subject).to receive(:resume).with(eid, data).and_return(response)
        expect(subject.resume(eid, data)).to eq(response)
      end
    end
    
    context ".suspend" do
      it "suspends the service" do
        data = { }

        allow(subject).to receive(:suspend).with(eid, data).and_return(response)
        expect(subject.suspend(eid, data)).to eq(response)
      end
    end
    
    context ".add_service_usage_rule_to_service" do
      it "adds a service usage rule to the service" do
        data = { }

        allow(subject).to receive(:add_service_usage_rule_to_service).with(eid, data).and_return(response)
        expect(subject.add_service_usage_rule_to_service(eid, data)).to eq(response)
      end
    end
    
    context ".remove_service_usage_rule_from_service" do
      it "removes a service usage rule from the service" do
        data = { }

        allow(subject).to receive(:remove_service_usage_rule_from_service).with(eid, data).and_return(response)
        expect(subject.remove_service_usage_rule_from_service(eid, data)).to eq(response)
      end
    end
    
  end
end
