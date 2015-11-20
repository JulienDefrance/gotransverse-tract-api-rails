module GoTransverseTractApi

  module Service

    class Service

      class << self

        #
        # @param {Long} eid
        #
        def self.find_by_eid eid
          GoTransverseTractApi.get_response_for(self, {eid: eid})
        end

        #
        # @param {Long} product_eid
        #
        def find_by_product_eid product_eid
          GoTransverseTractApi.get_response_for(self, {product_eid: product_eid})
        end

        #
        # @param {Long} custom_field_value_eid
        #
        def find_by_custom_field_value_eid custom_field_value_eid
          GoTransverseTractApi.get_response_for(self, {custom_field_value_eid: custom_field_value_eid})
        end

        #
        # @param {Long} parent_eid
        #
        def self.find_by_parent_eid parent_eid
          GoTransverseTractApi.get_response_for(self, {parent_eid: parent_eid})
        end

        #
        # @param {Long} billing_account_eid
        #
        def find_by_billing_account_eid billing_account_eid
          GoTransverseTractApi.get_response_for(self, {billing_account_eid: billing_account_eid})
        end

        #
        # @param {Long} agreement_eid
        #
        def find_by_agreement_eid agreement_eid
          GoTransverseTractApi.get_response_for(self, {agreement_eid: agreement_eid})
        end

        #
        # @param {Long} account_num
        #
        def find_by_account_num account_num
          GoTransverseTractApi.get_response_for(self, {account_num: account_num})
        end

        #
        # @param {Long} external_account_num
        #
        def find_by_external_account_num external_account_num
          GoTransverseTractApi.get_response_for(self, {external_account_num: external_account_num})
        end

        #
        # @param {Long} service_resource_identifier
        #
        def find_by_service_resource_identifier service_resource_identifier
          GoTransverseTractApi.get_response_for(self, {service_resource_identifier: service_resource_identifier})
        end

        #
        # @param {Long} renewal_count
        #
        def find_by_renewal_count renewal_count
          GoTransverseTractApi.get_response_for(self, {renewal_count: renewal_count})
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def resume eid, service
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service.to_s, "resume")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def suspend eid, service
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service.to_s, "suspend")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def self.add_service_resource eid, service
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service.to_s, "addServiceResource")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def self.remove_service_resource eid, service
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service.to_s, "removeServiceResource")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def self.add_service_usage_rule_to_service eid, service
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service.to_s, "addServiceUsageRuleToService")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def self.remove_service_usage_rule_from_service eid, service
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service.to_s, "removeServiceUsageRuleFromService")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def self.add_agreement eid, service
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service.to_s, "addAgreement")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def self.add_counter eid, service
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service.to_s, "addCounter")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def self.add_custom_field_value eid, service
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service.to_s, "addCustomFieldValue")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def self.remove_custom_field_value eid, service
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service.to_s, "removeCustomFieldValue")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def self.add_discount_identifier eid, service
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service.to_s, "addDiscountIdentifier")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def change_price eid, service
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service.to_s, "changePrice")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def change_quantity eid, service
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service.to_s, "changeQuantity")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def renew eid, service
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service.to_s, "renew")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def deactivate eid, service
          GoTransverseTractApi.post_request_for(self, {eid: eid}, service.to_s, "deactivate")
        end

        #
        # @param {Long} eid
        # @param {Nokogiri::XML::Document} service
        #
        def update eid, service
          GoTransverseTractApi.put_request_for(self, {eid: eid}, service.to_s)
        end

      end

    end

  end

end
