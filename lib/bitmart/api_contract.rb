module Bitmart
    module API
        module V1
            class Contract
                API_ENDPOINT = 'https://api-cloud.bitmart.com/contract/v1'.freeze

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

                    # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/contracts
                def get_contracts
                    params = {'exchange': 'bitmart'}
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/contracts",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/pnls
                def get_pnls(contractId)
                    params = {'contractID': contractId}
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/pnls",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/indexes
                def get_indexes
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/indexes",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/tickers
                def get_tickers(contractId = nil)
                    params = {}
                    params = {'contractID': contractId} if contractId   
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/tickers",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/quote
                def get_quote(contractId, startTime, endTime, unit, resolution)
                    params = {
                                'contractID': contractId, 
                                'endTime': endTime, 
                                'resolution': resolution,
                                'startTime': startTime, 
                                'unit': unit, 
                            }
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/quote",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/indexquote
                def get_index_quote(indexId, startTime, endTime, unit, resolution)
                    params = {
                                'endTime': endTime, 
                                'indexID': indexId, 
                                'resolution': resolution,
                                'startTime': startTime, 
                                'unit': unit, 
                            }
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/indexquote",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/trades
                def get_trades(contractId)
                    params = {'contractID': contractId}
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/trades",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/depth
                def get_depth(contractId, count = nil)
                    params = {'contractID': contractId}
                    param['count'] = count if count
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/depth",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/fundingrate
                def get_funding_rate(contractId)
                    params = {'contractID': contractId}
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/fundingrate",
                        params: params
                    )
                end

                # Order API
                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/userOrders
                def get_user_orders(contractId, status, offset = nil, size = nil)
                    params = {'contractID': contractId, 'status': status}
                    if offset && size
                        params['offset'] = offset
                        params['size'] = size
                    end
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/userOrders",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/userOrderInfo
                def get_user_order_info(contractId, orderId)
                    params = {'contractID': contractId, 'orderID': orderId}
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/userOrderInfo",
                        params: params
                    )
                end

                # POST https://api-cloud.bitmart.com/contract/v1/ifcontract/submitOrder
                def post_submit_order(contractId, category, way, openType, leverage, customId, price, vol)
                    params = {
                        'category': category,
                        'contract_id': contractId,
                        'custom_id': customId,
                        'leverage': leverage,
                        'open_type': openType,
                        'price': price,
                        'vol': vol,
                        'way': way,
                    }
                    request(
                        http_method: :post,
                        endpoint: "ifcontract/submitOrder",
                        params: params
                    )
                end

                # POST https://api-cloud.bitmart.com/contract/v1/ifcontract/batchOrders
                def post_submit_batch_order(orders)
                    params = {'orders': orders}
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/batchOrders",
                        params: params
                    )
                end

                # POST https://api-cloud.bitmart.com/contract/v1/ifcontract/cancelOrders
                def post_cancel_order(contractId, orders)
                    params = {'contractID': contractId, 'orders': orders}
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/cancelOrders",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/userTrades
                def get_user_trades(contractId, offset = nil, size = nil)
                    params = {'contractID': contractId}
                        params['offset'] = offset if offset
                        params['size'] = size if size
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/userTrades",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/orderTrades
                def get_order_trades(contractId, orderId)
                    params = {'contractID': contractId, 'orderID': orderId}
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/orderTrades",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/accounts
                def get_accounts(coinCode)
                    params = {'coinCode': coinCode}
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/userOrders",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/userPositions
                def get_user_positions(contractId)
                    params = {'contractID': contractId}
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/userPositions",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/userLiqRecords
                def get_user_liq_records(contractId, orderId)
                    params = {
                                'contractID': contractId, 
                                'orderID': orderId
                            }
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/userLiqRecords",
                        params: params
                    )
                end

                # GET https://api-cloud.bitmart.com/contract/v1/ifcontract/positionFee
                def get_position_fee(contractId, positionId)
                    params = {
                                'contractID': contractId, 
                                'positionID': positionId
                            }
                    request(
                        http_method: :get,
                        endpoint: "ifcontract/positionFee",
                        params: params
                    )
                end

                # POST https://api-cloud.bitmart.com/contract/v1/ifcontract/marginOper
                def post_margin_oper(contractId, positionId, vol, operType)
                    params = {
                                'contract_id': contractId, 
                                'oper_type': operType,
                                'position_id': positionId, 
                                'vol': vol, 
                            }
                    request(
                        http_method: :post,
                        endpoint: "ifcontract/marginOper",
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