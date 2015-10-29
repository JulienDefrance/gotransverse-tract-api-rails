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
require "gotransverse-tract-api/order/person"
require "gotransverse-tract-api/order/product_relation"
require "gotransverse-tract-api/order/renewal_order"
require "gotransverse-tract-api/order/sales_order"

require "gotransverse-tract-api/product/action"
require "gotransverse-tract-api/product/operation"
require "gotransverse-tract-api/product/price_list"
require "gotransverse-tract-api/product/price_range"
require "gotransverse-tract-api/product/product"
require "gotransverse-tract-api/product/product_category"
require "gotransverse-tract-api/product/product_price"
require "gotransverse-tract-api/product/usage_rule"

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

module GotransverseTractApi

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
  #  GotransverseTractApi.configure do |config|
  #    config.user_id = <gotransverse_tract_user_id>
  #    config.password = <gotransverse_tract_password>
  #  end
  #
  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  #
  # self.get_api_url_for
  #
  # @param {Class} klass
  #
  def self.get_api_url_for klass
    "#{GotransverseTractApi.configuration.tract_api_url}/#{klass.classname.camelize(:lower).pluralize}"
  end

  #
  # self.get_response_from
  #
  # @param {String} api_url
  # @param {Hash} api_params
  # @param {Hash} headers (optional)
  #
  def self.get_response_from(api_url, api_params, headers={})

    if GotransverseTractApi.configuration.cache_enabled
      return self.get_cached_response_from(api_url, api_params, headers)
    end

    # Unless cached
    self.call(api_url, api_params, headers, :get)
  end

  #
  # self.post_request_to
  #
  # @param {String} api_url
  # @param {Hash} api_params
  # @param {Hash} headers (optional)
  #
  def self.post_request_to(api_url, api_params, headers={})
    self.call(api_url, api_params, headers, :post)
  end

  #
  # self.put_request_to
  #
  # @param {String} api_url
  # @param {Hash} api_params
  # @param {Hash} headers (optional)
  #
  def self.put_request_to(api_url, api_params, headers={})
    self.call(api_url, api_params, headers, :put)
  end

  private

  #
  # self.get_cached_response_from
  #
  # @param {String} api_url
  # @param {Hash} api_params
  # @param {Hash} headers (optional)
  #
  def self.get_cached_response_from(api_url, api_params, headers={})
    key = "#{api_url}.#{api_params.sort}"

    return Rails.cache.fetch(key, expires_in: 10.minutes) do
      self.get_response_from(api_url, api_params, headers)
    end

    return self.get_response_from(api_url, api_params, headers)
  end

  #
  # self.call
  #
  # @param {String} api_url
  # @param {Hash} api_params
  # @param {Hash} headers (optional)
  # @param {String} method (optional)
  #
  def self.call(api_url, api_params, headers={}, method=:get)

    http_client = HTTPClient.new
    case method
      when :get
        response = http_client.get(api_url, api_params, headers)
      when :post
        response = http_client.post(api_url, api_params, headers)
      when :put
        response = http_client.put(api_url, api_params, headers)
    end

    Nokogiri::XML(response.body.to_s)
  end

end
