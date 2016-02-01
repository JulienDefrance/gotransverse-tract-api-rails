module GoTransverseTractApi

  module GeneralLedger

    class GLAccount

      #
      # @param {Long} eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_eid eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {eid: eid, queryScope: query_scope})
      end

      #
      # @param {Long} general_ledger_eid
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_general_ledger_eid general_ledger_eid, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {general_ledger_eid: general_ledger_eid, queryScope: query_scope})
      end

      #
      # @param {String} name
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_name name, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {name: name, queryScope: query_scope})
      end

      #
      # @param {String} account_num
      # @param {String} query_scope (default: 'SHALLOW')
      #
      def self.find_by_account_num account_num, query_scope=nil
        GoTransverseTractApi.get_response_for(self, {account_num: account_num, queryScope: query_scope})
      end

    end

  end

end
