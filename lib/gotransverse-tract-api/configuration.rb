module GoTransverseTractApi

  class Configuration

    attr_accessor :username
    attr_accessor :password

    attr_accessor :cache_enabled
    attr_accessor :debug_mode

    attr_accessor :tract_api_host
    attr_accessor :tract_secured_payment_host

    #
    # initialize
    #
    def initialize
      @tract_api_host = "https://my.tractbilling.com"
      @tract_secured_payment_host ||= @tract_api_host
    end

    #
    # tract_api_url
    #
    def tract_api_url
      "#{@tract_api_host}/t/s/r/#{GoTransverseTractApi::TARGET_API_VERSION}"
    end

  end
end
