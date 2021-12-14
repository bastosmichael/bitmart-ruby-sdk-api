require "faraday"
require "oj"
require "bitmart/version"
require "bitmart/api_account"
require "bitmart/api_contract"
require "bitmart/api_spot"
require "bitmart/api_system"

module Bitmart
  class Error < StandardError; end
  class Client
    attr_reader :api_key
    attr_reader :api_sign
    attr_reader :api_memo

    def initialize(api_key = nil, api_signature = nil, api_memo = nil)
      @api_key = api_key
      @api_sign = api_sign
      @api_memo = api_memo
    end

    def client
      @_client ||= Faraday.new(API_ENDPOINT) do |client|
      client.request :url_encoded
      client.adapter Faraday.default_adapter
      timestamp = Time.now.getutc.to_i.to_s
      signature = [timestamp,"#",api_memo,"#",client.params.to_s].join if api_memo&.present?
      signed = OpenSSL::HMAC.hexdigest("SHA256", signature, api_sign) if signature
      client.headers['X-BM-KEY'] = api_key if api_key&.present?
      client.headers['X-BM-SIGN'] = signed if signed&.present?
      client.headers['X-BM-TIMESTAMP'] = timestamp
      end
  end

    def request(http_method:, endpoint:, params: {})
      response = client.public_send(http_method, endpoint, params)
      Oj.load(response.body)
    end
  end
end
