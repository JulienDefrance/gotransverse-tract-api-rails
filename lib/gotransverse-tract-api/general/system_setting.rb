module GoTransverseTractApi

  module General

    class SystemSetting

      def self.find_all
        GoTransverseTractApi.get_response_for(self.class)
      end

    end

  end

end