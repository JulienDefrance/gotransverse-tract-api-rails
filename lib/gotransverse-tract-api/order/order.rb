module GoTransverseTractApi

  module Order

    class Order < Common::OrderBase

      class << self

        #
        # @param {Long} eid
        # @param {Hash} sales_order
        #
        def add_custom_field_value_to_order(eid, sales_order, custom_field_eid=nil)
          data = 
            {
              addCustomFieldValueToOrder: {},
              salesOrder: { eid: eid },
              customFieldValue: { attributes: {value: sales_order[:value]} }
            }

          data[:customFieldValue][:customField] = { eid: custom_field_eid } if custom_field_eid

          xml_data = GoTransverseTractApi.generateXML(data,'addCustomFieldValueToOrder')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "addCustomFieldValue")
        end

        #
        # @param {Long} eid
        # @param {Hash} sales_order
        #
        def remove_custom_field_value_from_order eid, sales_order
          data = {
            removeCustomFieldValueFromOrder: {},
            salesOrder: { eid: eid },
            customFieldValue: { eid: sales_order[:custom_field_value_eid] }
          }
 
          xml_data = GoTransverseTractApi.generateXML(data,'removeCustomFieldValueFromOrder')
          GoTransverseTractApi.post_request_for(self, {eid: eid}, xml_data, "removeCustomFieldValue")
        end

      end

    end

  end

end
