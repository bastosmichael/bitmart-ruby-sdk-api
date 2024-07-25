[![Logo](./logo.png)](https://bitmart.com)

# BitMart-Ruby-SDK-API

Ruby client for the [BitMart Cloud API](http://developer-pro.bitmart.com).

## Features

- Provides exchange quick trading API
- Easier withdrawal
- Efficiency, higher speeds, and lower latencies
- Priority in development and maintenance
- Dedicated and responsive technical support
- Provides WebSocket API calls
- Supports spot trading, contract trading, and account management

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitmart'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install bitmart
```

## Usage

### API Example

Here's an example of using the Spot API:

```ruby
require "bitmart"

spot = Bitmart::API::V1::Spot.new("your_api_key", "your_api_secret", "your_api_memo")

# Get all currencies
currencies = spot.get_currencies

# Get user's wallet
wallet = spot.get_wallet

# Place a limit buy order
order = spot.post_submit_limit_buy_order("BTC_USDT", "0.01", "30000")

# Get order details
order_details = spot.get_user_order_detail("BTC_USDT", order["data"]["order_id"])
```

## API Documentation

The BitMart Ruby SDK provides access to the following API classes:

1. `Bitmart::API::System`: System-level operations (e.g., getting system time)
2. `Bitmart::API::V1::Account`: Account management operations
3. `Bitmart::API::V1::Spot`: Spot trading operations
4. `Bitmart::API::V1::Contract`: Contract trading operations

Each class provides methods corresponding to BitMart API endpoints. Refer to the [BitMart API documentation](http://developer-pro.bitmart.com) for detailed endpoint descriptions.

## Error Handling

The SDK throws exceptions for API errors. Always wrap your API calls in a begin-rescue block:

```ruby
begin
  result = spot.get_currencies
rescue StandardError => e
  puts "An error occurred: #{e.message}"
end
```

## Versioning

Current version: 0.1.3

Please check the [CHANGELOG.md](CHANGELOG.md) file for version history and breaking changes.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Please note that we follow the principle of limiting functions to a maximum of 5 lines per function and 5 functions per object.

## Testing

To run the test suite:

```
$ rake spec
```

We aim for high test coverage. Please ensure that your contributions are well-tested.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Changelog

### v0.1.3 (2021-12-10)
- Proof of concept Ruby gem build with working API endpoints

## API Rate Limiting

BitMart imposes rate limits on API calls. Please refer to the [official documentation](http://developer-pro.bitmart.com) for the most up-to-date information on rate limits.

To handle rate limits, implement exponential backoff in your application when you receive a rate limit error.

## Troubleshooting

If you encounter any issues:

1. Ensure you're using the latest version of the gem
2. Check that your API key and secret are correct
3. Verify that you're not exceeding rate limits

For further assistance, please open an issue on the GitHub repository or contact BitMart support.
