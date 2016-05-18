require 'spec_helper'

module GoTransverseTractApi

  RSpec.describe BillingAccount::BillingAccount do
    before(:each) { http_auth }

    let(:response)  { {a: 'b', c: 'd'} }
    let(:eid) { '165' }
    let(:addresses) { {
      email_address: {
        purpose: 'PRIMARY',
        email: 'test@gotransverse.com'
      },
      postal_address: {
        purpose: 'BILLING',
        country: 'USA',
        city: 'Pleasanton',
        region_or_state: 'CA',
        attention: 'John Simth',
        postal_code: '94588',
        line1: '3423 something st.'
      },
      telecom_address: {
        purpose: 'OFFICE',
        dialing_prefix: '9',
        country_code: '1',
        area_code: '925',
        number: '2341212',
        extension: '21'
      }
    } }

    context ".find_by_eid" do
      it "returns a billing account details for a given eid" do
        data = described_class.find_by_eid('165')
        expect(data).to_not be_nil
      end
    end

    context ".apply_payment" do
      it "applies a payment to the invoice" do
        data = {
          billing_account: {
            eid: '123'
          },
          invoice: {
            eid: '456'
          },
          payment: {
            amount: '27',
            use_recurring_payment: 'false',
            credit_card_payment: {
              card_type: 'VISA',
              card_holder_first_name: 'Mary',
              card_holder_last_name: 'Smith',
              card_identifier_number: '4111111111111111111',
              card_verification_number: '123',
              card_expiration: '12/2016',
              description: 'Test Desc'
            },
            billing_account: {
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
          billing_account: {
            eid: '123'
          },
          reason: {
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
          billing_account: {eid: eid},
          start_date: '2014-11-11T100000',
          notes: 'Test notes here'
        }

        allow(subject).to receive(:resume).with(eid, data).and_return(response)
        expect(subject.resume(eid, data)).to eq(response)
      end
    end

    context ".add_recurring_payment" do
      it "adds a recurring payment to the billing account" do
        eid = '165'

        data = {
          billing_account: {eid: eid},
          recurring_payment: {
            referenced_credit_card_payment_method: {
              reference_key: 'sd2342sgdf28t7r82df'
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
          service: {eid: '136'},
          order: {
            note: 'Simple note',
            order_items: {
              order_item: {
                quantity: 2,
                description: 'change service',
                products: [{
                  eid: '1234'
                },
                {
                  eid: '4567'
                }]
              }
            },
            billing_account: {eid: eid}
          }
        }

        allow(subject).to receive(:change_service).with(eid, data).and_return(response)
        expect(subject.change_service(eid, data)).to eq(response)
      end
    end

    context ".add_custom_field_value" do
      it "adds custom field value to the billing account" do
        data = { 
          billing_account: { eid: eid },
          custom_field_value: { value: 'yes' }
        }

        allow(subject).to receive(:add_custom_field_value).with(eid, data).and_return(response)
        expect(subject.add_custom_field_value(eid, data)).to eq(response)
      end
    end

    context ".remove_custom_field_value" do
      it "removes custom field value from the billing account" do
        data = { 
          billing_account: { eid: eid },
          custom_field_value: { eid: '486' }
        }

        allow(subject).to receive(:remove_custom_field_value).with(eid, data).and_return(response)
        expect(subject.remove_custom_field_value(eid, data)).to eq(response)
      end
    end

    context ".deactivate" do
      it "deactivates a billing account" do
        data = {
          billing_account: { eid: '123' },
          reason: { eid: '456' }
        }

        allow(subject).to receive(:deactivate).with(eid, data).and_return(response)
        expect(subject.deactivate(eid, data)).to eq(response)
      end
    end

    context ".create_billing_account" do
      it "creates a billing account" do
        data = {
          bill_type:  'NONE',
          daily_bill_cycle: { eid:'38' },
          organization: {
            name: 'LMH Services',
            addresses: addresses.delete_if{|k,v| k == :telecom_address}
          },
          billing_account_category: {
            eid: '6'
          },
          payment_term: {
            name: 'Immediate',
            eid: '8'
          }
        }

        allow(subject).to receive(:create_billing_account).with(data).and_return(response)
        expect(subject.create_billing_account(data)).to eq(response)
      end
    end

    context ".add_person" do
      it "adds a person to the billing account" do
        data = {
          billing_account: { eid: eid },
          person: {
            first_name: 'Tim',
            last_name: 'John',
            middle_name: 'R',
            addresses: addresses
          }
        }

        allow(subject).to receive(:add_person).with(eid, data).and_return(response)
        expect(subject.add_person(eid, data)).to eq(response)
      end
    end
     
    context ".remove_billing_account" do
      it "removes a person from the billing account" do
        data = {
          billing_account: { eid: eid },
          person: { eid: '123' }
        }

        allow(subject).to receive(:remove_billing_account).with(eid, data).and_return(response)
        expect(subject.remove_billing_account(eid, data)).to eq(response)
      end
    end

    describe ".create_draft_order" do
      let(:data) {
        {
          sales_order: {
            referral: 'Unit Test Referral',
            order_date: '2016-01-28T172213',
            order_status: 'DRAFT',
            custom_field_values: {
              custom_field_value: {
                value: 'SOI',
                custom_field: {eid: '26'}
              }
            },
            order_items: {
              order_item: [{
                recurring_unit_price: '0.00',
                quantity:  '1',
                sequence:  '1',
                description: 'dsfsgegebdbb',
                product: { eid: '79' },
                selected_agreement: { eid: '15' },
                recurring_product_price: { eid: '174' },
                onetime_product_price: [100, { eid: '278' }],
                custom_field_values: {
                  custom_field_value: {
                    value: 'JLS',
                    custom_field: {eid: '25'}
                  }
                },
                order_item_usage_rules: {
                  match_all_order_item_usage_rule: {
                    name: 'allowance',
                    status: 'ACTIVE',
                    allowance_type: 'One Time',
                    limit: '100',
                    usage_uom: 'COUNT',
                    charge_category: '39',
                    match_all_product_usage_rule: { eid: '74' },
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
                    identifier: 'PCFC6000053765',
                    category: { eid: '9' }
                  }
                }
              },
              {
                recurring_unit_price: '100.00',
                quantity:  '1',
                sequence:  '1',
                description: 'dsfsgegebdbb',
                product: { eid: '79' },
                selected_agreement: { eid: '15' },
                recurring_product_price: { eid: '174' },
                custom_field_values: {
                  custom_field_value: {
                    value: 'JLS',
                    custom_field: {eid: '25'}
                  }
                },
                order_item_usage_rules: {
                  match_all_order_item_usage_rule: {
                    name: 'allowance',
                    status: 'ACTIVE',
                    allowance_type: 'One Time',
                    limit: '100',
                    usage_uom: 'COUNT',
                    charge_category: '39',
                    match_all_product_usage_rule: { eid: '74' },
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
                    identifier: 'PCFC4004078766',
                    category: { eid: '9' }
                  }
                }
              }]
            },
            billing_account: { eid: eid }
          }
        }
      }
      it "creates a draft sales order without a promo code for the billing account" do
        allow(subject).to receive(:create_draft_order).with(eid, data).and_return(response)
        expect(subject.create_draft_order(eid, data)).to eq(response)
      end

      it "creates a draft sales order with promo code for the billing account" do
        promo_code = {
          discount_configurations: {
            discount_configuration: {
              discount_identifier: { eid:'35' }
            }
          }
        }

        [0,1].each { |i| data[:sales_order][:order_items][:order_item][i].merge! promo_code }

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
          billing_account_category: { eid:'3453' }
        }

        allow(subject).to receive(:update).with(eid, data).and_return(response)
        expect(subject.update(eid, data)).to eq(response)
      end
    end
    
    context ".update_address" do
      it "updates a billing account address" do
        data = { 
          eid: eid, 
          bill_type: 'NONE',
          automatic_recurring_payment: 'true',
          addresses: addresses.delete_if{|k,v| k == :email_address}
        }

        allow(subject).to receive(:update_address).with(eid, data).and_return(response)
        expect(subject.update_address(eid, data)).to eq(response)
      end
    end
    
  end
end

