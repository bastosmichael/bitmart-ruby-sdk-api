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

Here's an example of using the Spot API:

```ruby
require "bitmart"

spot = Bitmart::API::V1::Spot.new("your_api_key", "your_api_secret", "your_api_memo")

# Get all currencies
currencies = spot.get_currencies

# Get user's wallet
wallet = spot.get_wallet

# Place a limit buy order
spot.post_submit_limit_buy_order("BTC_USDT", "0.01", "30000")

# Get user's open orders
open_orders = spot.get_user_orders("BTC_USDT", 0, 100, "active")
```

## API Documentation

### Account API

The Account API provides methods for managing user accounts, including:

- `get_currencies`: Get all supported currencies
- `get_wallet`: Get user's wallet balances
- `get_deposit_address`: Get deposit address for a currency
- `get_withdraw_charge`: Get withdrawal fees for a currency
- `post_withdraw_apply`: Submit a withdrawal request
- `get_deposit_withdraw_history`: Get deposit and withdrawal history
- `get_deposit_withdraw_detail`: Get details of a specific deposit or withdrawal

### Contract API

The Contract API provides methods for trading futures contracts, including:

- `get_contracts`: Get all available contracts
- `get_tickers`: Get ticker information for contracts
- `get_depth`: Get order book depth for a contract
- `post_submit_order`: Submit a new order
- `post_cancel_order`: Cancel an existing order
- `get_user_positions`: Get user's current positions

### Spot API

The Spot API provides methods for spot trading, including:

- `get_symbols`: Get all trading pairs
- `get_ticker`: Get ticker information for all symbols
- `get_symbol_kline`: Get K-line (candlestick) data for a symbol
- `post_submit_limit_buy_order`: Submit a limit buy order
- `post_submit_limit_sell_order`: Submit a limit sell order
- `post_submit_market_buy_order`: Submit a market buy order
- `post_submit_market_sell_order`: Submit a market sell order
- `get_user_orders`: Get user's orders

### System API

The System API provides methods for system-related information:

- `get_system_time`: Get the current server time
- `get_system_service`: Get the current system service status

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bastosmichael/bitmart-ruby-sdk-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/bastosmichael/bitmart-ruby-sdk-api/blob/master/CODE_OF_CONDUCT.md).

## Release Notes

### 2021-12-10 (v0.1.0)
- Proof of concept Ruby gem build with working API endpoints.

### 2023-05-26 (v0.1.3)
- Added Contract API support
- Enhanced documentation for all API modules
- Improved error handling and request signing
- Updated dependencies and compatibility

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
