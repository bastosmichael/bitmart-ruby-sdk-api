require 'ap'
require 'oj'

module Bitmart
    module API
        module V1
            class Spot
                API_ENDPOINT = 'https://api-cloud.bitmart.com/spot/v1'.freeze

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

                # basic API
                # GET https://api-cloud.bitmart.com/spot/v1/currencies
                def get_currencies
                    request(
                        http_method: :get,
                        endpoint: "currencies"
                    )
                end

                # GET https://api-cloud.bitmart.com/spot/v1/symbols
                def get_symbols
                    request(
                        http_method: :get,
                        endpoint: "symbols"
                    )
                end

                # GET https://api-cloud.bitmart.com/spot/v1/symbols/details
                def get_symbol_detail
                    request(
                        http_method: :get,
                        endpoint: "symbols/details"
                    )
                end

                # GET https://api-cloud.bitmart.com/spot/v1/ticker
                def get_ticker
                    request(
                        http_method: :get,
                        endpoint: "ticker"
                    )
                end

                def get_symbol_ticker(symbol)
                    params = {'symbol' => symbol}
                    request(
                        http_method: :get,
                        endpoint: "ticker",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/spot/v1/steps
                def get_steps
                    request(
                        http_method: :get,
                        endpoint: "steps"
                    )
                end

                # GET https://api-cloud.bitmart.com/spot/v1/symbols/kline
                def get_symbol_kline(symbol, fromTime, toTime, step = 1)
                    params = {
                        'symbol' => symbol,
                        'from' => fromTime,
                        'to' => toTime,
                        'step' => step
                    }
                    request(
                        http_method: :get,
                        endpoint: "symboles/kline",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/spot/v1/symbols/book
                def get_symbol_book(symbol, precision = nil, size = nil)
                    params = {
                        'symbol' => symbol
                    }
                    param['precision'] = precision if precision
                    param['size'] = size if size
                    request(
                        http_method: :get,
                        endpoint: "symbols/book",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/spot/v1/symbols/trades
                def get_symbol_trades(symbol)
                    params = {
                        'symbol' => symbol
                    }
                    request(
                        http_method: :get,
                        endpoint: "symbols/trades",
                        params: params
                    )
                end

                # trade API

                # GET https://api-cloud.bitmart.com/spot/v1/wallet
                def get_wallet
                    request(
                        http_method: :get,
                        endpoint: "wallet"
                    )
                end

                # POST https://api-cloud.bitmart.com/spot/v1/submit_order
                def post_submit_limit_buy_order(symbol, size='', price='')
                    params = {
                        'price' => price,
                        'side' => 'buy',
                        'size' => size,
                        'symbol' => symbol,
                        'type' => 'limit',
                    }
                    request(
                        http_method: :post,
                        endpoint: "submit_order",
                        params: params
                    )
                end

                def post_submit_limit_sell_order(symbol, size='', price='')
                    params = {
                        'price' => price,
                        'side' => 'sell',
                        'size' => size,
                        'symbol' => symbol,
                        'type' => 'limit',
                    }
                    request(
                        http_method: :post,
                        endpoint: "submit_order",
                        params: params
                    )
                end

                def post_submit_market_sell_order(symbol, size='')
                    params = {
                        'side' => 'sell',
                        'size' => size,
                        'symbol' => symbol,
                        'type' => 'market',
                    }
                    request(
                        http_method: :post,
                        endpoint: "submit_order",
                        params: params
                    )
                end

                def post_submit_market_buy_order(symbol, notional='')
                    params = {
                        'notional' => notional,
                        'side' => 'buy',
                        'symbol' => symbol,
                        'type' => 'market',
                    }
                    request(
                        http_method: :post,
                        endpoint: "submit_order",
                        params: params
                    )
                end

                # POST https://api-cloud.bitmart.com/spot/v2/cancel_order
                def post_cancel_order(symbol, orderId)
                    params = {
                        'order_id' => orderId,
                        'symbol' => symbol,
                    }
                    request(
                        http_method: :post,
                        endpoint: "cancel_order",
                        params: params
                    )
                end

                # POST https://api-cloud.bitmart.com/spot/v1/cancel_orders
                def post_cancel_orders(symbol, side)
                    params = {
                        'side' => side,
                        'symbol' => symbol,
                    }
                    request(
                        http_method: :post,
                        endpoint: "cancel_orders",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/spot/v1/order_detail
                def get_user_order_detail(symbol, orderId)
                    params = {
                        'order_id' => orderId,
                        'symbol' => symbol,
                    }
                    request(
                        http_method: :get,
                        endpoint: "order_detail",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/spot/v1/orders
                def get_user_orders(symbol, offset, limit, status)
                    params = {
                        'limit' => limit,
                        'offset' => offset,
                        'status' => status,
                        'symbol' => symbol,
                    }
                    request(
                        http_method: :get,
                        endpoint: "orders",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/spot/v1/trades
                def get_user_order_trades(symbol, orderId)
                    params = {
                        'order_id' => orderId,
                        'symbol' => symbol
                    }
                    request(
                        http_method: :get,
                        endpoint: "trades",
                        params: params
                    )
                end

                def get_user_trades(symbol, offset, limit)
                    params = {
                        'limit' => limit,
                        'offset' => offset,
                        'symbol' => symbol,        
                    }
                    request(
                        http_method: :get,
                        endpoint: "trades",
                        params: params
                    )
                end

                private

                def client
                    @_client ||= Faraday.new(API_ENDPOINT) do |client|
                        client.request :url_encoded
                        client.adapter Faraday.default_adapter
                        client.headers["Content-Type"] = "application/json"
                        client.headers['X-BM-KEY'] = api_key unless api_key&.nil?
                        client.headers['X-BM-SIGN'] = @signature if @signature
                        client.headers['X-BM-TIMESTAMP'] = @timestamp if @timestamp
                    end
                end
              
                def request(http_method:, endpoint:, params: {})
                    if http_method == :post
                        @timestamp = Bitmart::API::System.new.get_system_time["data"]["server_time"].to_s
                        params = Oj.dump(params)
                        data = [timestamp,"#",api_memo,"#",params].join 
                        @signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), api_sign, data)
                    end
                    response = client.public_send(http_method, endpoint, params)
                    Oj.load(response.body)
                end
            end
        end
    end
end