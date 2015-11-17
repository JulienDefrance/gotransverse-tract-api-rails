class Configuration

  attr_accessor :user_id
  attr_accessor :password
  attr_accessor :basic_credentials

  attr_accessor :cache_enabled
  attr_accessor :tract_api_url

  #
  # initialize
  #
  def initialize
    @tract_api_url = "https://my.tractbilling.com/t/s/r/#{GoTransverseTractApi::TARGET_API_VERSION}"
    set_basic_credentials
  end

  private

  #
  # set_basic_credentials
  #
  def set_basic_credentials

    # Perform Base-64 encoding of API login information
    user_pass = "#{@user_id.to_s}:#{@password.to_s}"

    # Sets basic_credentials attr_accessor
    @basic_credentials = Base64.encode64(user_pass)

    # Erase in-clear credentials
    @user_id = @password = nil

  end

end

