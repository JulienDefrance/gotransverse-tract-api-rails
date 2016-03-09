module GoTransverseTractApi

  module Common
    
    class Base

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
        # @param {String} name
        # @param {Hash} options
        #
        def find_by_name name, options={}
          return nil unless name.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({name: name}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {String} status
        # @param {Hash} options
        #
        def find_by_status status, options={}
          return nil unless status.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({status: status}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

    class OrderBase

      class << self

        #
        # @param {Long} account_num
        # @param {Hash} options
        #
        def find_by_account_num account_num, options={}
          return nil unless account_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({account_num: account_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} external_account_num
        # @param {Hash} options
        #
        def find_by_external_account_num external_account_num, options={}
          return nil unless external_account_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({external_account_num: external_account_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} order_num
        # @param {Hash} options
        #
        def find_by_order_num order_num, options={}
          return nil unless order_num.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({order_num: order_num}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Long} billing_account_eid
        # @param {Hash} options
        #
        def find_by_billing_account_eid billing_account_eid, options={}
          return nil unless billing_account_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({billing_account_eid: billing_account_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

      end

    end

    class ServiceBase

      class << self

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
        # @param {Long} service_eid
        # @param {Hash} options
        #
        def find_by_service_eid service_eid, options={}
          return nil unless service_eid.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({service_eid: service_eid}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Date} start_date
        # @param {Hash} options
        #
        def find_by_start_date start_date, options={}
          return nil unless start_date.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({start_date: start_date}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end

        #
        # @param {Date} end_date
        # @param {Hash} options
        #
        def find_by_end_date end_date, options={}
          return nil unless end_date.present?

          params ||= GoTransverseTractApi::ApiData.new.get_query_params({end_date: end_date}, options)
          GoTransverseTractApi.get_response_for(self, params)
        end
     
      end

    end

  end

end
