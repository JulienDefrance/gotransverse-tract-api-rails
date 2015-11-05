module GoTransverseTractApi

  module GeneralLedger

    class GLAccount

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self.class, {eid: eid})
      end

      #
      # @param {Long} general_ledger_eid
      #
      def self.find_by_general_ledger_eid general_ledger_eid
        GoTransverseTractApi.get_response_for(self.class, {general_ledger_eid: general_ledger_eid})
      end

      #
      # @param {String} name
      #
      def self.find_by_name name
        GoTransverseTractApi.get_response_for(self.class, {name: name})
      end

      #
      # @param {String} account_num
      #
      def self.find_by_account_num account_num
        GoTransverseTractApi.get_response_for(self.class, {account_num: account_num})
      end

    end

  end

end