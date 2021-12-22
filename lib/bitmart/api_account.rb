module Bitmart
    module API
        module V1
            class Account
                API_ENDPOINT = 'https://api-cloud.bitmart.com/account/v1'.freeze

                attr_reader :api_key
                attr_reader :api_sign
                attr_reader :api_memo
                attr_reader :timestamp
                attr_reader :signature

                def initialize(api_key = nil, api_sign = nil, api_memo = nil)
                    @api_key = api_key
                    @api_sign = api_sign
                    @api_memo = api_memo
                end

                # GET https://api-cloud.bitmart.com/account/v1/currencies
                def get_currencies
                    request(
                        http_method: :get,
                        endpoint: "currencies"
                    )
                end

                # GET https://api-cloud.bitmart.com/account/v1/wallet
                def get_wallet(accountType)
                    params = {
                        'account_type': accountType
                    }
                    request(
                        http_method: :get,
                        endpoint: "wallet",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/account/v1/deposit/address
                def get_deposit_address(currency)
                    params = {
                        'currency': currency
                    }
                    request(
                        http_method: :get,
                        endpoint: "wallet",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/account/v1/withdraw/charge
                def get_withdraw_charge(currency)
                    params = {
                        'currency': currency
                    }
                    request(
                        http_method: :get,
                        endpoint: "withdraw/charge",
                        params: params
                    )
                end

                # POST https://api-cloud.bitmart.com/account/v1/withdraw/apply
                def post_withdraw_apply(currency, amount, destination, address, address_memo)
                    params = {
                        'address': address,
                        'address_memo': address_memo,
                        'amount': amount,
                        'currency': currency,
                        'destination': destination,
                    }
                    request(
                        http_method: :post,
                        endpoint: "withdraw/apply",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/account/v1/deposit-withdraw/history
                def get_deposit_withdraw_history(currency, operationType, offset, limit)
                    params = {
                        'currency': currency,
                        'limit': limit,
                        'offset': offset,
                        'operation_type': operationType,
                    }
                    request(
                        http_method: :get,
                        endpoint: "deposit-withdraw/history",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/account/v1/deposit-withdraw/detail
                def get_deposit_withdraw_detail(id)
                    params = {
                        'id': id
                    }
                    request(
                        http_method: :get,
                        endpoint: "deposit-withdraw/detail",
                        params: params
                    )
                end

                private

                def client
                    @_client ||= Faraday.new(API_ENDPOINT) do |client|
                        client.request :url_encoded
                        client.adapter Faraday.default_adapter
                        client.headers['X-BM-KEY'] = api_key unless api_key&.nil?
                        client.headers['X-BM-SIGN'] = @signature if @signature
                        client.headers['X-BM-TIMESTAMP'] = @timestamp if @timestamp
                    end
                end
              
                def request(http_method:, endpoint:, params: {})
                    unless http_method == :post && api_memo&.nil? && api_sign&.nil?
                        @timestamp = Bitmart::API::System.new.get_system_time["data"]["server_time"].to_s
                        data = [timestamp,"#",api_memo,"#",URI.encode_www_form(params)].join 
                        @signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), api_sign, data)
                    end
                    response = client.public_send(http_method, endpoint, params)
                    Oj.load(response.body)
                end
            end
        end
    end
end