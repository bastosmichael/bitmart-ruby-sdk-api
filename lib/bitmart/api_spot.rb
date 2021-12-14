module Bitmart
    module API
        module V1
            class Spot
                API_ENDPOINT = 'https://api-cloud.bitmart.com/spot/v1'.freeze

                attr_reader :api_key
                attr_reader :api_sign

                def initialize(api_key = nil, api_sign = nil)
                    @api_key = api_key
                    @api_sign = api_sign
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
                        endpoint: "symboles/details"
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
                    params = {'symbol': symbol}
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
                        'symbol': symbol,
                        'from': fromTime,
                        'to': toTime,
                        'step': step
                    }
                    request(
                        http_method: :get,
                        endpoint: "symboles/kline",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/spot/v1/symbols/book
                def get_symbol_book(symbol, precision, size)
                    params = {
                        'symbol': symbol
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
                        'symbol': symbol
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
                        'symbol': symbol,
                        'side': 'buy',
                        'type': 'limit',
                        'size': size,
                        'price': price
                    }
                    request(
                        http_method: :post,
                        endpoint: "submit_order",
                        params: params
                    )
                end

                def post_submit_limit_sell_order(symbol, size='', price='')
                    params = {
                        'symbol': symbol,
                        'side': 'sell',
                        'type': 'limit',
                        'size': size,
                        'price': price
                    }
                    request(
                        http_method: :post,
                        endpoint: "submit_order",
                        params: params
                    )
                end

                def post_submit_market_sell_order(symbol, size='')
                    params = {
                        'symbol': symbol,
                        'side': 'sell',
                        'type': 'market',
                        'size': size
                    }
                    request(
                        http_method: :post,
                        endpoint: "submit_order",
                        params: params
                    )
                end

                def post_submit_market_buy_order(symbol, notional='')
                    params = {
                        'symbol': symbol,
                        'side': 'buy',
                        'type': 'market',
                        'notional': notional
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
                        'symbol': symbol,
                        'order_id': orderId
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
                        'symbol': symbol,
                        'side': side
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
                        'symbol': symbol,
                        'order_id': orderId
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
                        'symbol': symbol,
                        'offset': offset,
                        'limit': limit,
                        'status': status
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
                        'symbol': symbol,
                        'order_id': orderId
                    }
                    request(
                        http_method: :get,
                        endpoint: "trades",
                        params: params
                    )
                end

                def get_user_trades(symbol, offset, limit)
                    params = {
                        'symbol': symbol,
                        'offset': offset,
                        'limit': limit
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
                    client.headers['X-BM-KEY'] = api_key if api_key&.present?
                    client.headers['X-BM-SIGN'] = api_sign if api_sign&.present?
                    end
                end

                def request(http_method:, endpoint:, params: {})
                    response = client.public_send(http_method, endpoint, params)
                    Oj.load(response.body)
                end
            end
        end
    end
end