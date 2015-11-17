module GoTransverseTractApi

  module Service

    class ServiceResourceCategory

      def self.find_all
        GoTransverseTractApi.get_response_for(self)
      end

    end

  end

end