module GoTransverseTractApi

  module Order

    class Agreement

      def self.find_all
        GoTransverseTractApi.get_response_for(self)
      end

    end

  end

end