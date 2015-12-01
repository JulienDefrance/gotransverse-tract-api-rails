require "gotransverse-tract-api/version"

require "gotransverse-tract-api/configuration"
require "gotransverse-tract-api/hash"

require "gotransverse-tract-api/billing_account/adjustment"
require "gotransverse-tract-api/billing_account/adjustment_application"
require "gotransverse-tract-api/billing_account/adjustment_reason"
require "gotransverse-tract-api/billing_account/billing_account"
require "gotransverse-tract-api/billing_account/counter"
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
require "gotransverse-tract-api/billing_account/standard_invoice_adjustment_application"

require "gotransverse-tract-api/general/system_setting"

require "gotransverse-tract-api/general_ledger/general_ledger"
require "gotransverse-tract-api/general_ledger/gl_account"
require "gotransverse-tract-api/general_ledger/gl_account_category"
require "gotransverse-tract-api/general_ledger/gl_accounting_transaction"
require "gotransverse-tract-api/general_ledger/gl_adjustment_accounting_transaction"
require "gotransverse-tract-api/general_ledger/gl_accounting_entry"
require "gotransverse-tract-api/general_ledger/gl_aggregate_batch"
require "gotransverse-tract-api/general_ledger/gl_aggregate_entry"
require "gotransverse-tract-api/general_ledger/gl_invoice_accounting_transaction"
require "gotransverse-tract-api/general_ledger/gl_payment_accounting_transaction"
require "gotransverse-tract-api/general_ledger/gl_transaction_batch"

require "gotransverse-tract-api/order/adjustment_category"
require "gotransverse-tract-api/order/agreement"
require "gotransverse-tract-api/order/bill_cycle"
require "gotransverse-tract-api/order/billing_account_category"
require "gotransverse-tract-api/order/order_item"
require "gotransverse-tract-api/order/order_item_charge"
require "gotransverse-tract-api/order/organization"
require "gotransverse-tract-api/order/party_category"
require "gotransverse-tract-api/order/payment_term"
require "gotransverse-tract-api/order/people"
require "gotransverse-tract-api/order/product_relation"
require "gotransverse-tract-api/order/renewal_order"
require "gotransverse-tract-api/order/sales_order"

require "gotransverse-tract-api/product/action"
require "gotransverse-tract-api/product/discount_category"
require "gotransverse-tract-api/product/discount"
require "gotransverse-tract-api/product/discount_charge_category"
require "gotransverse-tract-api/product/discount_code"
require "gotransverse-tract-api/product/discount_identifier"
require "gotransverse-tract-api/product/billing_account_segment"
require "gotransverse-tract-api/product/billing_account_segment_field"
require "gotransverse-tract-api/product/operation"
require "gotransverse-tract-api/product/operation_attribute"
require "gotransverse-tract-api/product/price_list"
require "gotransverse-tract-api/product/product_price_range"
require "gotransverse-tract-api/product/product"
require "gotransverse-tract-api/product/product_tag"
require "gotransverse-tract-api/product/product_category"
require "gotransverse-tract-api/product/product_price"
require "gotransverse-tract-api/product/one_time_product_price"
require "gotransverse-tract-api/product/product_tag"
require "gotransverse-tract-api/product/recurring_product_price"
require "gotransverse-tract-api/product/usage_rule"

require "gotransverse-tract-api/service/service"
require "gotransverse-tract-api/service/service_device_inventory_item"
require "gotransverse-tract-api/service/service_period"
require "gotransverse-tract-api/service/service_price"
require "gotransverse-tract-api/service/service_price_range"
require "gotransverse-tract-api/service/service_resource"
require "gotransverse-tract-api/service/service_resource_category"

require "gotransverse-tract-api/usage/global_usage_rule"
require "gotransverse-tract-api/usage/order_item_usage_rule"
require "gotransverse-tract-api/usage/product_usage_rule"
require "gotransverse-tract-api/usage/rate_table"
require "gotransverse-tract-api/usage/service_usage_rule"
require "gotransverse-tract-api/usage/usage_event"
require "gotransverse-tract-api/usage/usage_lookup_table"
require "gotransverse-tract-api/usage/usage_lookup_table_entry"
require "gotransverse-tract-api/usage/usage_rule"
require "gotransverse-tract-api/usage/usage_price_category"

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
    self.call(klass, api_url, api_params, :get)
  end

  #
  # self.post_request_for
  #
  # @param {Class} klass
  # @param {Hash} api_params (optional)
  # @param {Hash} request_body
  # @param {String} command
  #
  def self.post_request_for(klass, api_params={}, request_body, command)
    api_url = GoTransverseTractApi.get_api_url_for(klass)
    api_url = "#{api_url}/#{command}"
    
    self.call(klass, api_url, api_params, :post, request_body)
  end

  #
  # self.put_request_for
  #
  # @param {Class} klass
  # @param {Hash} api_params (optional)
  # @param {Hash} request_body
  #
  def self.put_request_for(klass, api_params={}, request_body)
    api_url = GoTransverseTractApi.get_api_url_for(klass)
    self.call(klass, api_url, api_params, :put, request_body.to_xml)
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
  # @param {Class} klass
  # @param {String} api_url
  # @param {Hash} api_params (optional)
  # @param {String} method (optional)
  # @param {String} request_body (optional, put/post requests only)
  #
  def self.call(klass, api_url, api_params={}, method=:get, request_body="")

    # Camelize parameters
    api_params = camelize_keys(api_params)

    http_client = HTTPClient.new
    http_client.set_auth(nil, GoTransverseTractApi.configuration.username, GoTransverseTractApi.configuration.password)

    case method
      when :get
        response = http_client.get(api_url, api_params)
      when :post
        response = http_client.post(api_url, request_body, {'Content-Type' => 'application/xml'})
      when :put
        response = http_client.put(api_url, request_body, api_params)
    end

    xml_response = Nokogiri::XML(response.body.to_s)

    klass = klass.to_s.split("::").last
    hsh = Hash.from_xml(xml_response.to_s).recursive_symbolize_keys!

    if method == :get
      hsh = hsh[klass.pluralize.camelize(:lower).to_sym][klass.camelize(:lower).to_sym] rescue Hash.from_xml(xml_response.to_s)[klass.camelize(:lower).to_sym]
    end

    return hsh
  rescue
    {}
  end
  
  #
  # self.camelize_keys
  #
  # @param {hash} hsh
  #
  def self.camelize_keys hsh
    hsh.keys.each do |k|
      new_key = k.to_s.camelize(:lower)
      new_key = new_key.to_sym if k.is_a? Symbol
      hsh[new_key] = hsh.delete(k)
    end
    hsh
  end

end
