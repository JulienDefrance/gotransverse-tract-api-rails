module AuthHelper

  def http_auth
    GoTransverseTractApi.configure do|config|
        config.username = "API-5"
        config.password = "<s{&G_R2sZ"
        config.tract_api_host = "https://smartzip.tract-staging.com"
    end
  end

end
