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
- Supports Spot, Contract, and Account APIs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitmart'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install bitmart

## Usage

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

# Get user's orders
orders = spot.get_user_orders("BTC_USDT", 0, 10, "active")
```

## Available APIs

### Spot API

- `get_currencies`: Get list of currencies
- `get_symbols`: Get list of trading symbols
- `get_ticker`: Get ticker information
- `get_symbol_kline`: Get K-line data for a symbol
- `get_symbol_book`: Get order book for a symbol
- `get_wallet`: Get user's wallet information
- `post_submit_limit_buy_order`: Place a limit buy order
- `post_submit_limit_sell_order`: Place a limit sell order
- `post_submit_market_buy_order`: Place a market buy order
- `post_submit_market_sell_order`: Place a market sell order
- `post_cancel_order`: Cancel an order
- `get_user_orders`: Get user's orders

### Contract API

- `get_contracts`: Get list of contracts
- `get_tickers`: Get ticker information for contracts
- `get_depth`: Get order book for a contract
- `post_submit_order`: Place an order for a contract
- `post_cancel_order`: Cancel a contract order
- `get_user_positions`: Get user's positions

### Account API

- `get_wallet`: Get user's wallet information
- `get_deposit_address`: Get deposit address for a currency
- `post_withdraw_apply`: Apply for withdrawal
- `get_deposit_withdraw_history`: Get deposit and withdrawal history

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bastosmichael/bitmart-ruby-sdk-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/bastosmichael/bitmart-ruby-sdk-api/blob/master/CODE_OF_CONDUCT.md).

## Release Notes

### 2021-12-10 (v0.1.3)
- Added Contract API support
- Added Account API support
- Improved error handling and request signing
- Updated documentation and examples

### 2021-12-01 (v0.1.0)
- Initial release with Spot API support

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
