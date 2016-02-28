module GoTransverseTractApi

  module Service

    class Service

      class << self

        #
        # @param {Long} eid
        # @param {Hash} options
        #
        def find_by_eid eid, options=nil
          return nil unless eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} product_eid
        # @param {Hash} options
        #
        def find_by_product_eid product_eid, options=nil
          return nil unless product_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({product_eid: product_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        # @param {Long} custom_field_value_eid
        # @param {Hash} options
        #
        def find_by_custom_field_value_eid custom_field_value_eid, options=nil
          return nil unless custom_field_value_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({custom_field_value_eid: custom_field_value_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} parent_eid
        # @param {Hash} options
        #
        def find_by_parent_eid parent_eid, options=nil
          return nil unless parent_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({parent_eid: parent_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} billing_account_eid
        # @param {Hash} options
        #
        def find_by_billing_account_eid billing_account_eid, options=nil
          return nil unless billing_account_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({billing_account_eid: billing_account_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} agreement_eid
        # @param {Hash} options
        #
        def find_by_agreement_eid agreement_eid, options=nil
          return nil unless agreement_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({agreement_eid: agreement_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} account_num
        # @param {Hash} options
        #
        def find_by_account_num account_num, options=nil
          return nil unless account_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({account_num: account_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} external_account_num
        # @param {Hash} options
        #
        def find_by_external_account_num external_account_num, options=nil
          return nil unless external_account_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({external_account_num: external_account_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} service_resource_identifier
        # @param {Hash} options
        #
        def find_by_service_resource_identifier service_resource_identifier, options=nil
          return nil unless service_resource_identifier.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({service_resource_identifier: service_resource_identifier}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} renewal_count
        # @param {Hash} options
        #
        def find_by_renewal_count renewal_count, options=nil
          return nil unless renewal_count.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({renewal_count: renewal_count}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def resume eid, service
          data = {
            resumeService: {},
            service: {eid: eid}
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'resumeService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "resume")
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def suspend eid, service
          data = {
            suspendService: {},
            service: {eid: eid}
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'suspendService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "suspend")
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def add_service_resource eid, service
          data = {
            addServiceResourceToService: {},
            service: {eid: eid},
            serviceResource: {
              attributes: {
                identifier: service[:service_resource][:identifier]
              },
              category: {
                eid: :service[:service_resource][:category][:eid]
              }
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'addServiceResourceToService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "addServiceResource")
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def remove_service_resource eid, service
          data = {
            removeServiceResourceFromService: {},
            service: {eid: eid},
            serviceResource: {eid: service[:service_resource][:eid]}
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'removeServiceResourceFromService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "removeServiceResource")
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def add_service_usage_rule_to_service eid, service
          data = {
            addServiceUsageRuleToService: {},
            service: {eid: eid},
            matchAllServiceUsageRule: {
              attributes: {
                limit: service[:match_all_service_usage_rule][:limit],
                usageUom: service[:match_all_service_usage_rule][:usage_uom],
                name: service[:match_all_service_usage_rule][:name],
                order: service[:match_all_service_usage_rule][:order],
                proratedOnOrder: service[:match_all_service_usage_rule][:prorated_on_order],
                proratedOnCancel: service[:match_all_service_usage_rule][:prorated_on_cancel],
                rollOverType: service[:match_all_service_usage_rule][:roll_over_type],
                allowanceType: service[:match_all_service_usage_rule][:allowance_type],
                validFrom: service[:match_all_service_usage_rule][:valid_from],
                validTo: service[:match_all_service_usage_rule][:valid_to],
                ruleType: service[:match_all_service_usage_rule][:rule_type],
                status: service[:match_all_service_usage_rule][:status]
              },
              chargeCategory: {
                eid: service[:match_all_service_usage_rule][:charge_categroy][:eid]
              },
              flatUsageRate: {
                uom: service[:match_all_service_usage_rule][:flat_usage_rate][:uom],
                validFrom: service[:match_all_service_usage_rule][:flat_usage_rate][:valid_from],
                validTo: service[:match_all_service_usage_rule][:flat_usage_rate][:valid_to],
                rate: service[:match_all_service_usage_rule][:flat_usage_rate][:rate]
              }
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'addServiceUsageRuleToService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "addServiceUsageRule")
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def remove_service_usage_rule_from_service eid, service
          data = {
            removeServiceUsageRuleFromService: {},
            service: {eid: eid},
            matchAllServiceUsageRule: {
              eid: service[:match_all_service_usage_rule][:eid]
            }
          }
          xml_data = GoTransverseTractApi.generateXML(data, 'removeServiceUsageRuleFromService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "removeServiceUsageRule")
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def add_agreement eid, service
          data = {
            addAgreementToService: {},
            service: {eid: eid},
            agreementService: {
              attributes: {
                endAction: service[:agreement_service][:end_action],
                endDate: service[:agreement_service][:end_date],
                startDate: service[:agreement_service][:start_date]
              },
              agreement: {
                eid: service[:agreement_service][:agreement][:eid]
              }
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'addAgreementToService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "addAgreement")
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def add_counter eid, service
          data = {
            addCounterToService: {},
            service: {eid: eid},
            usageRuleCounter: {
              attributes: {
                name: service[:usage_rule_counter][:name],
                description: service[:usage_rule_counter][:description],
                status: service[:usage_rule_counter][:status],
                entityRelationType: service[:usage_rule_counter][:entity_relation_type],
                uom: service[:usage_rule_counter][:uom],
                threshold: service[:usage_rule_counter][:threshold]
              },
              servicePeriodCounterResetCriteria: {}
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'addCounterToService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "addCounter")
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def add_custom_field_value eid, service
          data = {
            addCustomFieldValueToService: {},
            service: {eid: eid},
            customFieldValue: {
              attributes: {
                value: service[:custom_field_value][:value]
              },
              customField: {
                eid: service[:custom_field_value][:custom_field][:eid]
              }
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'addCustomFieldValueToService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "addCustomFieldValue")
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def remove_custom_field_value eid, service
          data = {
            removeCustomFieldValueFromService: {},
            service: {eid: eid},
            customFieldValue: {
              eid: service[:custom_field_value][:eid]
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'removeCustomFieldValueFromService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "removeCustomFieldValue")
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def add_discount_identifier eid, service
          api_data = GoTransverseTractApi::ApiData.new

          data = { 
            addDiscountIdentifierToService: {},
            service: {
              attributes: {
                amount: service[:amount],
                startDate: service[:start_date],
                status: service[:status],
                description: service[:description],
                renewalCount: service[:renewal_count],
                eid: service[:eid],
                queryScope: service[:query_scope]
              },
              billingAccount: {
                eid: service[:billing_account][:eid],
                queryScope: service[:billing_account][:query_scope]
              },
              serviceResources: GoTransverseTractApi::ApiData.new.get_page_info(service[:service_resources]),
              product: {
                eid: service[:product][:eid],
                queryScope: service[:product][:query_scope]
              },
              servicePeriods: api_data.get_page_info(service[:service_periods]),
              servicePrices: api_data.get_page_info(service[:service_prices]),
              serviceUsageRules: api_data.get_page_info(service[:service_usage_rules]),
              counters: api_data.get_page_info(service[:counters]),
              customFieldValues: api_data.get_page_info(service[:custom_field_values])
            },
            discountIdentifier: {
              attributes: {
                status: service[:discount_identifier][:status],
                unlimited: service[:discount_identifier][:unlimited],
                uses: service[:discount_identifier][:uses],
                identifier: service[:discount_identifier][:identifier],
                eid: service[:discount_identifier][:eid],
                queryScope: service[:discount_identifier][:query_scope]
              },
              category: {
                eid: service[:discount_identifier][:category][:eid],
                queryScope: service[:discount_identifier][:category][:query_scope]
              }
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'addDiscountIdentifierToService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "addDiscountIdentifier")
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def change_price eid, service
          data = {
            changeServicePrice: {
              attributes: {
                newRecurringUnitPrice: service[:new_recurring_unit_price]
              },
              service: {eid: eid}
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'changeServicePrice')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "changePrice")
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def change_quantity eid, service
          data = {
            changeServiceQuantity: {
              attributes: {
                newQuantity: service[:new_quantity],
                effectiveDate: service[:effective_date]
              },
              service: {eid: eid}
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'changeServiceQuantity')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "changeQuantity")
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def renew eid, service
          data = {
            renewService: {},
            service: {
              attributes: {eid: eid},
              billingAccount: {
                eid: service[:billing_account][:eid]
              }
            },
            order: {
              attributes: {},
              orderItems: {
                attributes: {},
                orderItem: {
                  attributes: {
                    quantity: service[:order][:order_items][:order_item][:quantity],
                    sequence: service[:order][:order_items][:order_item][:sequence]
                  },
                  product: {
                    eid: service[:order][:order_items][:order_item][:product][:eid]
                  },
                  selectedAgreement: {
                    eid: service[:order][:order_items][:order_item][:selected_agreement][:eid]
                  }
                }
              },
              billingAccount: { eid: service[:order][:billing_account][:eid] },
              payments: {
                attributes: {},
                payment: {
                  attributes: {
                    amount: service[:order][:payments][:payment][:amount],
                    description: service[:order][:payments][:payment][:description]
                  },
                  billingAccount: { eid: service[:order][:payments][:payment][:billing_account][:eid] },
                  creditCardPayment: {
                    cardType: service[:order][:payments][:payment][:credit_card_payment][:card_type],
                    cardHolderFirstName: service[:order][:payments][:payment][:credit_card_payment][:card_holder_first_name],
                    cardHolderMiddleName: service[:order][:payments][:payment][:credit_card_payment][:card_holder_middle_name],
                    cardHolderLastName: service[:order][:payments][:payment][:credit_card_payment][:card_holder_last_name],
                    cardIdentifierNumber: service[:order][:payments][:payment][:credit_card_payment][:card_identifier_number],
                    cardExpiration: service[:order][:payments][:payment][:credit_card_payment][:card_expiration]
                  }
                }
              }
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'renewService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "renew")
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def deactivate eid, service
          data = {
            deactivateService: {},
            service: {eid: eid}
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'deactivateService')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "deactivate")
        end

        #
        # @param {Long} eid
        # @param {Hash} service
        #
        def update eid, service
          data = {
            service: {
              eid: eid,
              description: service[:description]
            }
          }

          xml_data = GoTransverseTractApi.generateXML(data, 'service')
          GoTransverseTractApi.put_request_for(self, {eid: eid}, xml_data)
        end

      end

    end

  end

end
