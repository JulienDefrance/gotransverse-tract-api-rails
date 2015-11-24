module AuthHelper

  def http_auth
    GoTransverseTractApi.configure do |config|
        config.username = ENV["GOTRANSVERSE_TRACT_USERNAME"]
        config.password = ENV["GOTRANSVERSE_TRACT_PASSWORD"]
        config.tract_api_host = ENV["GOTRANSVERSE_TRACT_API_HOST"]
    end
  end

end