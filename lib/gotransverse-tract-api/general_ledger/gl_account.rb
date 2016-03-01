module GoTransverseTractApi

  module GeneralLedger

    class GLAccount

      #
      # @param {Long} eid
      # @param {Hash} options
      #
      def self.find_by_eid eid, options=nil
        return nil unless eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({eid: eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {Long} general_ledger_eid
      # @param {Hash} options
      #
      def self.find_by_general_ledger_eid general_ledger_eid, options=nil
        return nil unless general_ledger_general_ledger_eid.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({general_ledger_eid: general_ledger_eid}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {String} name
      # @param {Hash} options
      #
      def self.find_by_name name, options=nil
        return nil unless name.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({name: name}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

      #
      # @param {String} account_num
      # @param {Hash} options
      #
      def self.find_by_account_num account_num, options=nil
        return nil unless account_num.present?

        params ||= GoTransverseTractApi::ApiData.new.get_query_params({account_num: account_num}, options)
        GoTransverseTractApi.get_response_for(self, params)
      end

    end

  end

end
