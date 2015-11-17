module GoTransverseTractApi

  module GeneralLedger

    class GLAccountingEntry

      #
      # @param {Long} eid
      #
      def self.find_by_eid eid
        GoTransverseTractApi.get_response_for(self, {eid: eid})
      end

      #
      # @param {Long} gl_account_eid
      #
      def self.find_by_gl_account_eid gl_account_eid
        GoTransverseTractApi.get_response_for(self, {gl_account_eid: gl_account_eid})
      end

    end

  end

end