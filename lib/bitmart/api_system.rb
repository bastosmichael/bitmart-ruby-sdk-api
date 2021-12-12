module Bitmart
    module API
        class System
            API_ENDPOINT = 'https://api-cloud.bitmart.com/system'.freeze

            # get system time
            def get_system_time
                request(
                    http_method: :get,
                    endpoint: "time"
                )
            end

            # get system service
            def get_system_service
                request(
                    http_method: :get,
                    endpoint: "service"
                )
            end

            private

            def client
                @_client ||= Faraday.new(API_ENDPOINT) do |client|
                client.request :url_encoded
                client.adapter Faraday.default_adapter
                end
            end

            def request(http_method:, endpoint:, params: {})
                response = client.public_send(http_method, endpoint, params)
                Oj.load(response.body)
            end
        end
    end
end