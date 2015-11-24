require "gotransverse-tract-api/version"
require "gotransverse-tract-api/configuration"

require "gotransverse-tract-api/billing_account/adjustment"
require "gotransverse-tract-api/billing_account/adjustment_reason"
require "gotransverse-tract-api/billing_account/billing_account"
require "gotransverse-tract-api/billing_account/custom_field"
require "gotransverse-tract-api/billing_account/custom_field_value"
require "gotransverse-tract-api/billing_account/invoice"
require "gotransverse-tract-api/billing_account/invoice_item"
require "gotransverse-tract-api/billing_account/invoice_item_charge"
require "gotransverse-tract-api/billing_account/payment"
require "gotransverse-tract-api/billing_account/reason"
require "gotransverse-tract-api/billing_account/recurring_payment"
require "gotransverse-tract-api/billing_account/refund"
require "gotransverse-tract-api/billing_account/scheduled_charge"

require "gotransverse-tract-api/general/system_setting"

require "gotransverse-tract-api/general_ledger/general_ledger"
require "gotransverse-tract-api/general_ledger/gl_account"
require "gotransverse-tract-api/general_ledger/gl_account_category"
require "gotransverse-tract-api/general_ledger/gl_accounting_entry"
require "gotransverse-tract-api/general_ledger/gl_aggregate_batch"
require "gotransverse-tract-api/general_ledger/gl_aggregate_entry"

require "gotransverse-tract-api/order/agreement"
require "gotransverse-tract-api/order/bill_cycle"
require "gotransverse-tract-api/order/billing_account_category"
require "gotransverse-tract-api/order/order_item"
require "gotransverse-tract-api/order/order_item_charge"
require "gotransverse-tract-api/order/organization"
require "gotransverse-tract-api/order/party_category"
require "gotransverse-tract-api/order/people"
require "gotransverse-tract-api/order/product_relation"
require "gotransverse-tract-api/order/renewal_order"
require "gotransverse-tract-api/order/sales_order"

require "gotransverse-tract-api/product/action"
require "gotransverse-tract-api/product/operation"
require "gotransverse-tract-api/product/operation_attribute"
require "gotransverse-tract-api/product/price_list"
require "gotransverse-tract-api/product/product_price_range"
require "gotransverse-tract-api/product/product"
# require "gotransverse-tract-api/product/product_category"
require "gotransverse-tract-api/product/product_price"
require "gotransverse-tract-api/product/usage_rule"
# require "gotransverse-tract-api/product/discount_category"

require "gotransverse-tract-api/service/service"
require "gotransverse-tract-api/service/service_device_inventory_item"
require "gotransverse-tract-api/service/service_period"
require "gotransverse-tract-api/service/service_price"
require "gotransverse-tract-api/service/service_price_range"
require "gotransverse-tract-api/service/service_resource"
require "gotransverse-tract-api/service/service_resource_category"

require "gotransverse-tract-api/usage/order_item_usage_rule"
require "gotransverse-tract-api/usage/product_usage_rule"
require "gotransverse-tract-api/usage/rate_table"
require "gotransverse-tract-api/usage/service_usage_rule"
require "gotransverse-tract-api/usage/usage_event"
require "gotransverse-tract-api/usage/usage_lookup_table"
require "gotransverse-tract-api/usage/usage_lookup_table_entry"
require "gotransverse-tract-api/usage/usage_rule"

require "httpclient"
require "nokogiri"

module GoTransverseTractApi

  class << self
    attr_accessor :configuration
  end

  #
  # self.configure
  #
  # Call this method to modify defaults in your initializers.
  # Yields SmartZipSDK configuration
  #
  # Examples:
  #
  #  GoTransverseTractApi.configure do |config|
  #    config.user_id = <gotransverse_tract_user_id>
  #    config.password = <gotransverse_tract_password>
  #    config.tract_api_host = <gotransverse_tract_api_host>
  #  end
  #
  def self.configure
    self.configuration ||= GoTransverseTractApi::Configuration.new
    yield(configuration)
  end

  #
  # self.get_api_url_for
  #
  # @param {Class} klass
  #
  def self.get_api_url_for klass
    klass = klass.to_s.split("::").last
    "#{GoTransverseTractApi.configuration.tract_api_url}/#{klass.camelize(:lower).pluralize}"
  end

  #
  # self.get_response_for
  #
  # @param {Class} klass
  # @param {Hash} api_params (optional)
  #
  def self.get_response_for(klass, api_params={})

    api_url = GoTransverseTractApi.get_api_url_for(klass)

    pp "api_url: " + api_url

    if GoTransverseTractApi.configuration.cache_enabled
      return self.get_cached_response_from(klass, api_params)
    end

    # Unless cached
    self.call(api_url, api_params, :get)
  end

  #
  # self.post_request_for
  #
  # @param {Class} klass
  # @param {Hash} api_params (optional)
  # @param {String} request_body
  # @param {String} command
  #
  def self.post_request_for(klass, api_params={}, request_body, command)
    api_url = GoTransverseTractApi.get_api_url_for(klass)
    api_url = "#{api_url}/#{command}"
    self.call(api_url, api_params, :post, request_body)
  end

  #
  # self.put_request_for
  #
  # @param {Class} klass
  # @param {Hash} api_params (optional)
  # @param {String} request_body
  #
  def self.put_request_for(klass, api_params={}, request_body)
    api_url = GoTransverseTractApi.get_api_url_for(klass)
    self.call(api_url, api_params, :put, request_body)
  end

  private

  #
  # self.get_cached_response_for
  #
  # @param {Class} klass
  # @param {Hash} api_params (optional)
  #
  def self.get_cached_response_for(klass, api_params={})
    key = "#{klass.name}.#{api_params.sort}"

    return Rails.cache.fetch(key, expires_in: 10.minutes) do
      self.get_response_from(klass, api_params)
    end

    return self.get_response_from(klass, api_params)
  end

  #
  # self.call
  #
  # @param {String} api_url
  # @param {Hash} api_params (optional)
  # @param {String} method (optional)
  # @param {String} request_body (optional, put/post requests only)
  #
  def self.call(api_url, api_params={}, method=:get, request_body="")

    # TODO: Camelize all keys in api_params Hash.

    http_client = HTTPClient.new
    http_client.set_auth(nil, GoTransverseTractApi.configuration.username, GoTransverseTractApi.configuration.password)

    case method
      when :get
        response = http_client.get(api_url, api_params)
      when :post
        response = http_client.post(api_url, request_body, api_params)
      when :put
        response = http_client.put(api_url, request_body, api_params)
    end

    Nokogiri::XML(response.body.to_s)
  end

end
