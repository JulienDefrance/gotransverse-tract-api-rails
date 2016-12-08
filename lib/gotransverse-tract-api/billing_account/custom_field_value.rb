module GoTransverseTractApi

  module BillingAccount

    class CustomFieldValue < Common::OrderBase

      class << self

        #
        # @param {Hash} options
        #
        def find_all options={}
          params ||= GoTransverseTractApi::ApiData.new.get_query_params({}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} eid
        # @param {Hash} options
        #
        def find_by_eid eid, options={}
          return nil unless eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} custom_field_eid
        # @param {Hash} options
        #
        def find_by_custom_field_eid custom_field_eid, options={}
          return nil unless custom_field_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({custom_field_eid: custom_field_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} order_eid
        # @param {Hash} options
        #
        def find_by_order_eid order_eid, options={}
          return nil unless order_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({order_eid: order_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} service_eid
        # @param {Hash} options
        #
        def find_by_service_eid service_eid, options={}
          return nil unless service_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({service_eid: service_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} order_item_eid
        # @param {Hash} options
        #
        def find_by_order_item_eid order_item_eid, options={}
          return nil unless order_item_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({order_item_eid: order_item_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} custom_field_name
        # @param {Hash} options
        #
        def find_by_custom_field_name custom_field_name, options={}
          return nil unless custom_field_name.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({custom_field_name: custom_field_name}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} value
        # @param {Hash} options
        #
        def find_by_value value, options={}
          return nil unless value.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({value: value}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Hash} obj (Order or Service or Billing Account)
        #
        def get_custom_field_values(obj={})
          return obj if obj.empty?

          if obj[:custom_field_value].is_a?(Hash)
            return { attributes: {}, customFieldValue: get_custom_field_value(obj[:custom_field_value]) }
          end

          custom_fields_struct = { attributes: {}, customFieldValue: [] }

          obj[:custom_field_value].each do|item|
            custom_fields_struct[:customFieldValue] << {
                customFieldValue: get_custom_field_value(item)
            }
          end

          custom_fields_struct
        end

        #
        # @param {Hash} field (custom_field_value)
        #
        def get_custom_field_value(field)
            custom_field_value = {
                attributes: {value: field[:value]},
                customField: {eid: field[:custom_field][:eid]}
            }

            custom_field_value
        end
      end

    end

  end

end
